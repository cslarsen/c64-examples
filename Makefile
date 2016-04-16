TARGETS := flicker
C1541 := /Applications/Vice64/tools/c1541
X64 := open /Applications/Vice64/x64.app

.PRECIOUS: %.d64

all: $(TARGETS)

%.prg: %.asm
	acme --cpu 6510 --format cbm --outfile $@ $<

%.d64: %.prg
	$(C1541) -format foo,id d64 $@ -write $<

%: %.d64
	$(X64) $<

clean:
	rm -f $(TARGETS) *.prg *.d64
