#include "CaeSim.h"
#include "CaeIsa.h"
#include <stdio.h>
#include <iostream>

#define MAX_AEG_INDEX 128
#define PERS_SIGN_CAE 0xFE2D001000101000LL

#define AEUIE 0
#undef DEBUG


typedef struct {
	unsigned int index;
	unsigned int others;
} bucket;


typedef struct {
    unsigned int index;     // index in genome
    unsigned int size : 11; // The "+ X others" value (if == 2047, replace with 236990858)
    int offset : 1;         // bit indicating whether the ivalue is an offset, or a new seed for the hash function
    int ivalue : 20;        // either the new seed OR an offset from the current location; current location = h(key, seed = 0)
} tinybucket;


// Rotate left (this should compile into a single instruction)
#define Rot64(x, k) ((x << k) | (x >> (64 - k)))

// Takes a 200 bit message, and a 20 bit seed, and produces a 64 bit hash
// ;range = # hash table entries
// ;bitlength = # of bits needed to represent range
unsigned int hash(unsigned char *message, unsigned int seed, unsigned int range, uint64 mask) {
    uint64 h0 = seed;
    uint64 h1 = seed;
    uint64 h2 = 0xdeadbeefdeadbeefLL;
    uint64 h3 = 0xdeadbeefdeadbeefLL;

    // Handles first 16 bytes       
    /////////////////////////////
    h2 += *((uint64 *) &message[0]); // h2 += bytes 0-7  (wires 0-63)
    h3 += *((uint64 *) &message[8]); // h3 += bytes 8-15 (wires 64-127)

    // Mix
    h2 = Rot64(h2,50) + h3;  h0 ^= h2;
    h3 = Rot64(h3,52) + h0;  h1 ^= h3;
    h0 = Rot64(h0,30) + h1;  h2 ^= h0;
    h1 = Rot64(h1,41) + h2;  h3 ^= h1;
    
    h2 = Rot64(h2,54) + h3;  h0 ^= h2;
    h3 = Rot64(h3,48) + h0;  h1 ^= h3;
    h0 = Rot64(h0,38) + h1;  h2 ^= h0;
    h1 = Rot64(h1,37) + h2;  h3 ^= h1;
    
    h2 = Rot64(h2,62) + h3;  h0 ^= h2;
    h3 = Rot64(h3,34) + h0;  h1 ^= h3;
    h0 = Rot64(h0,5)  + h1;  h2 ^= h0;
    h1 = Rot64(h1,36) + h2;  h3 ^= h1;
    
    
    // Handle the last 9 bytes
    /////////////////////////////
    h2 += *((uint64 *) &message[16]); // h2 += bytes 16-23             (wires 128-191)
    h3 = ((uint64) 25) << 56;		  // h3 = (length << 56) + byte 24 (wires 192-199)
    h3 += (uint64) message[24];

	// Ending Mix
    h3 ^= h2;  h2 = Rot64(h2,15);  h3 += h2;
    h0 ^= h3;  h3 = Rot64(h3,52);  h0 += h3;
    h1 ^= h0;  h0 = Rot64(h0,26);  h1 += h0;
    h2 ^= h1;  h1 = Rot64(h1,51);  h2 += h1;
    
    h3 ^= h2;  h2 = Rot64(h2,28);  h3 += h2;
    h0 ^= h3;  h3 = Rot64(h3,9);   h0 += h3;
    h1 ^= h0;  h0 = Rot64(h0,47);  h1 += h0;
    h2 ^= h1;  h1 = Rot64(h1,54);  h2 += h1;
    
    h3 ^= h2;  h2 = Rot64(h2,32);  h3 += h2;
    h0 ^= h3;  h3 = Rot64(h3,25);  h0 += h3;
    h1 ^= h0;  h0 = Rot64(h0,63);  h1 += h0;

    // Handle Range
    /////////////////////////////

    // h0 and h1 contain the 128-bit hash
    return (h0 & mask) % range; 
}



void CCaeIsa::InitPers() {
    SetAegCnt(MAX_AEG_INDEX);
    SetPersSign(PERS_SIGN_CAE);
}



void CCaeIsa::CaepInst(int aeId, int opcode, int immed, uint32 inst, uint64 scalar) {
    switch (opcode) {
        case 0x20:{

            cout << "Simulating reads on ae" << aeId << endl;

			// Base addresses
			uint64 genome_base_adr    = ReadAeg(aeId, 0);
			uint64 hashtable_base_adr = ReadAeg(aeId, 1);
			uint64 read_base_adr      = ReadAeg(aeId, 2);
			uint64 output_base_adr    = ReadAeg(aeId, 3);
			// Counts
			uint64 table_size = ReadAeg(aeId, 4); // # of entries; each entry is 8-bytes
			uint64 read_count = ReadAeg(aeId, 5); // # of entries; each entry is 32-bytes

			// Calculate bitlength
			unsigned char bitlength = 0;
			while ((1ULL << bitlength) < table_size) bitlength++;
			uint64 mask = 0xFFFFFFFFFFFFFFFFLL;
			mask = mask >> (57 - bitlength);

			// Loop variables
			uint64 counter, address, data;
			uint64 check[5];
			unsigned char read[25];
			unsigned int h;
			unsigned char shift;
			tinybucket entry;


			for (counter = aeId; counter < read_count; counter += 4) {
				// Step 1 - Get read
				address = (counter * 32) + read_base_adr;
				AeMemLoad(aeId, McNum(address)   , address   , 8, false, data);
				*((uint64 *) &read[0]) = data;
				AeMemLoad(aeId, McNum(address+8) , address+8 , 8, false, data);
				*((uint64 *) &read[8]) = data;
				AeMemLoad(aeId, McNum(address+16), address+16, 8, false, data);
				*((uint64 *) &read[16]) = data;
				AeMemLoad(aeId, McNum(address+24), address+24, 8, false, data);
				read[24] = data;
				
				

				// Step 2 - Hash read, get new seed / offset from intermediate table
				h = hash(read, 0, table_size, mask);	

				address = (h * 8) + hashtable_base_adr;
				AeMemLoad(aeId, McNum(address), address, 8, false, data);
				*((uint64 *) &entry) = data;



				// Step 3 - Rehash using new seed / offset, get index and count
				if (entry.offset) {
					h = hash(read, 0, table_size, mask);
					h += entry.ivalue; // offset is a signed 20-bit number
				} else {
					h = hash(read, entry.ivalue, table_size, mask);
					h += 0;
				}

				address = (h * 8) + hashtable_base_adr;
				AeMemLoad(aeId, McNum(address), address, 8, false, data);
				*((uint64 *) &entry) = data;
				
								

				// Step 4 - Load index from genome
				shift = entry.index & 0x1F;
				address = entry.index >> 2; // get byte address from base pair address
				address &= ~0x07;           // 8-byte align address
				address += genome_base_adr;
				AeMemLoad(aeId, McNum(address)   , address   , 8, false, check[0]);
				AeMemLoad(aeId, McNum(address+8) , address+8 , 8, false, check[1]);
				AeMemLoad(aeId, McNum(address+16), address+16, 8, false, check[2]);
				AeMemLoad(aeId, McNum(address+24), address+24, 8, false, check[3]);
				AeMemLoad(aeId, McNum(address+32), address+32, 8, false, check[4]);
				
				// Shift right by 'shift' base pairs
				if (shift) {
					check[0] = ( check[0] >> (2 * shift) )   |   ( check[1] << (64 - (2 * shift)) );
					check[1] = ( check[1] >> (2 * shift) )   |   ( check[2] << (64 - (2 * shift)) );
					check[2] = ( check[2] >> (2 * shift) )   |   ( check[3] << (64 - (2 * shift)) );
					check[3] = ( check[3] >> (2 * shift) )   |   ( check[4] << (64 - (2 * shift)) );
				}
				
				

				// Step 5 - Check read with genome; record output
				if (memcmp(read, check, 25) == 0) {
					// Read and genome match
					address = (counter * 8) + output_base_adr;
					bucket b;
					b.index = entry.index;
					b.others = entry.size;
					data = *((uint64 *) &b);
					AeMemStore(aeId, McNum(address), address, 8, false, data);
				}
			}

            cout << "Done simulating reads on ae" << aeId << endl;
	        break;
	    }
        case 0x21:{
            cout << "Hello World from emulated ae" << aeId << endl;
            break;
        }
	    default:{
	        printf("Default case hit - opcode = %x\n", opcode);
	        for (int aeId = 0; aeId < CAE_AE_CNT; aeId += 1)
		    SetException(aeId, AEUIE);
		}
    }
}
