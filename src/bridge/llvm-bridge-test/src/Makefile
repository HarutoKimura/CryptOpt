CC := rustc
CFLAGS := --crate-type=lib --emit=llvm-ir -C opt-level=0
tmp := ./pre-

all: func2.rs

%.json: %.ll llvm2json.py
	python3 llvm2json.py $< > $@

%.ll: %.rs
	$(CC) $(CFLAGS) $< -o $@

distclean:
	rm -f *.rs
	rm -f *.ll
	rm -f $(tmp)func2.json

func2.json: func2.rs