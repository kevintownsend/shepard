
	.file	"cpShepard.s"
	.ctext


#
# cpShepard function:
#   -transfers data to AEG registers 
# 	-calls caep00 to execute the genome search
#

	.globl	cpShepard
	.type	cpShepard. @function
	.signature	pdk=65069

cpShepard:
	mov %a8, $0, %aeg		# aeg[0] = genome_base_adr
	mov %a9, $1, %aeg		# aeg[1] = hashtable_base_adr
	mov %a10, $2, %aeg		# aeg[2] = reads_base_adr
	mov %a11, $3, %aeg		# aeg[3] = output_base_adr
	mov %a12, $4, %aeg		# aeg[4] = table_size  // 8-byte
	mov %a13, $5, %aeg		# aeg[5] = read_count  // 8-byte

	caep00 $0           # make the coprocessor call

	rtn 

	.cend
