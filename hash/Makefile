CFLAGS=-o3 -m64

all: ./bin/countUnique ./bin/createHashTable ./bin/align ./bin/getWindow

clean:
	rm -f ./bin/*

./bin/countUnique: ./src/countUnique.c ./src/common.h
	gcc $(CFLAGS) ./src/countUnique.c -o ./bin/countUnique
	
./bin/createHashTable: ./src/createHashTable.c ./src/common.h
	gcc $(CFLAGS) ./src/createHashTable.c -o ./bin/createHashTable

./bin/align: ./src/align.c ./src/common.h
	gcc $(CFLAGS) ./src/align.c -o ./bin/align

./bin/getWindow: ./src/getWindow.c ./src/common.h
	gcc $(CFLAGS) ./src/getWindow.c -o ./bin/getWindow
