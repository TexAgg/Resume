RESUME=resume
CV=cv

# Make everything.
.PHONY: all
all: resume cv


##########
# RESUME #
##########

.PHONY: resume
# The resume target consists of the pdf and a png.
resume: $(RESUME).pdf resume_png

# Make the resume pdf.
$(RESUME).pdf: $(RESUME).tex
	pdflatex $(RESUME).tex

# Use poppler-utils to convert the resume pdf to png.
# http://askubuntu.com/a/50180/574988
.PHONY: resume_png
resume_png: $(RESUME).pdf
	pdftoppm -png $(RESUME).pdf $(RESUME)

# View the resume pdf.
.PHONY: view_resume
view_resume: $(RESUME).pdf
	evince $(RESUME).pdf

######
# CV #
######

.PHONY: cv
cv: $(CV).pdf cv_png

# Create the cv.pdf
$(CV).pdf: $(CV).tex
	pdflatex $(CV).tex

.PHONY: cv_png
# Make the cv pngs.
cv_png: $(CV).pdf
	pdftoppm -png $(CV).pdf $(CV)

.PHONY: view_cv
# View the cv.
view_cv: $(CV).pdf
	evince $(CV).pdf


.PHONY: clean
# Remove output files.
clean:
	rm -rf *.aux *.out *.log