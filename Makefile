TEXFILE=main

# Make everything.
.PHONY: all
all: $(TEXFILE).pdf png

$(TEXFILE).pdf: $(TEXFILE).tex
	pdflatex $(TEXFILE).tex

.PHONY: clean
clean:
	rm -rf *.aux *.out *.log

# View pdf.
.PHONY: view
view: $(TEXFILE).pdf
	evince $(TEXFILE).pdf

# Use poppler-utils to convert the pdf to png.
# http://askubuntu.com/a/50180/574988
.PHONY: png
png: $(TEXFILE).pdf
	pdftoppm -png $(TEXFILE).pdf $(TEXFILE)