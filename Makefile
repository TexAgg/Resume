TEXFILE=main

$(TEXFILE).pdf: $(TEXFILE).tex
	pdflatex $(TEXFILE).tex

web:
	htlatex $(TEXFILE).tex

.PHONY: clean
clean:
	rm -rf *.aux *.blg *.out *.bbl *.log $(TEXFILE).run.xml $(TEXFILE)-blx.bib $(TEXFILE).4tc $(TEXFILE).dvi $(TEXFILE).xref $(TEXFILE).4ct *.lg *.tmp *.idv

view: $(TEXFILE).pdf
	evince $(TEXFILE).pdf &