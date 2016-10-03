RESUME=resume

# Make everything.
.PHONY: all
all: $(RESUME).pdf png

$(RESUME).pdf: $(RESUME).tex
	pdflatex $(RESUME).tex

.PHONY: clean
clean:
	rm -rf *.aux *.out *.log

# View pdf.
.PHONY: view
view: $(RESUME).pdf
	evince $(RESUME).pdf

# Use poppler-utils to convert the pdf to png.
# http://askubuntu.com/a/50180/574988
.PHONY: png
png: $(RESUME).pdf
	pdftoppm -png $(RESUME).pdf $(RESUME)