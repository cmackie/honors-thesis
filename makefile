.PHONY: all clean

SRC=thesis-sigconf

all: $(SRC)

$(SRC): $(SRC).tex
	mkdir -p build
	latexmk -f -pdf -jobname=build/$(SRC) '\input{$(SRC)}'
	latexmk -c -jobname=build/$(SRC)

clean:
	rm -rf build
