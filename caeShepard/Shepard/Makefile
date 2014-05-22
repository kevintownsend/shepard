EXEC = Shepard.exe
SWMODEL = ../sim/CaeSimPers

all:	$(EXEC) $(SWMODEL)

clean:
	rm -f $(EXEC)
	make --directory=../sim clean

$(EXEC):	Shepard.cpp cpShepard.s
	cnyCC Shepard.cpp cpShepard.s -o Shepard.exe

$(SWMODEL): ../Makefile.include ../sim/CaeIsaShepard.cpp
	make -C ../sim
