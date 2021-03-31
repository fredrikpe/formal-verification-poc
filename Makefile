
CC=clang

saw: ffs_llvm.saw ffs.bc
	saw ffs_llvm.saw 

ffs.bc: ffs.c
	$(CC) -g -c -emit-llvm -o ffs.bc ffs.c

clean:
	rm ffs.bc
