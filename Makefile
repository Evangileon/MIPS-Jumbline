
BIGM:=-Mgpr-names=32,cp0-names=mips32,cp0-names=mips32,hwr-names=mips32,reg-names=mips32
LITTLEM:=-mno-explicit-relocs -mno-local-sdata -mgp32 -mabi=eabi -mno-llsc -mno-abicalls -mno-embedded-data -mno-gpopt -mno-split-addresses

all:
	mips-linux-gnu-gcc -S -O $(BIGM) $(LITTLEM) rearrange.c
