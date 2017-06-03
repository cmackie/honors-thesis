.PHONY: all clean

COVER=coverpage
SRC=MackieChristopherThesis

all: bib-update
	latexmk -pdf -interaction=nonstopmode $(SRC).tex

cover:
	latexmk -pdf -interaction=nonstopmode $(COVER).tex

export BIBINPUTS ?= .:bib
bib:
ifdef PLUMEBIB
	ln -s ${PLUMEBIB} $@
else
	git clone https://github.com/mernst/plume-bib.git $@
endif
.PHONY: bib-update
bib-update: bib
# Even if this command fails, it does not terminate the make job.
# However, to skip it, invoke make as:  make NOGIT=1 ...
ifndef NOGIT
	-(cd bib && git pull && make)
endif
