TEXFILE=main

# Make everything.
all: $(TEXFILE).pdf web png

$(TEXFILE).pdf: $(TEXFILE).tex
	pdflatex $(TEXFILE).tex

web: $(TEXFILE).tex
	htlatex $(TEXFILE).tex

.PHONY: clean
clean:
	rm -rf *.aux *.blg *.out *.bbl *.log $(TEXFILE).run.xml $(TEXFILE)-blx.bib $(TEXFILE).4tc $(TEXFILE).dvi $(TEXFILE).xref $(TEXFILE).4ct *.lg *.tmp *.idv

# View pdf.
view: $(TEXFILE).pdf
	evince $(TEXFILE).pdf

# Use poppler-utils to convert the pdf to png.
# http://askubuntu.com/a/50180/574988
png: $(TEXFILE).pdf
	pdftoppm -png $(TEXFILE).pdf $(TEXFILE)