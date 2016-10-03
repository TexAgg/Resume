RESUME=resume

# Make everything.
.PHONY: all
all: resume

.PHONY: resume
# The resume target consists of the pdf and a png.
resume: $(RESUME).pdf resume_png

# Make the resume pdf.
$(RESUME).pdf: $(RESUME).tex
	pdflatex $(RESUME).tex

# Use poppler-utils to convert the resume pdf to png.
# http://askubuntu.com/a/50180/574988
.PHONY: png
resume_png: $(RESUME).pdf
	pdftoppm -png $(RESUME).pdf $(RESUME)

# View the resume pdf.
.PHONY: view
view_resume: $(RESUME).pdf
	evince $(RESUME).pdf


.PHONY: clean
clean:
	rm -rf *.aux *.out *.log