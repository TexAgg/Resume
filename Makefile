RESUME=resume
CV=cv
DATA=data/skills.json

# Make everything.
.PHONY: all
all: resume cv


##########
# RESUME #
##########

$(RESUME).tex: $(RESUME).template.tex $(DATA)
	python render.py

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
	pdftoppm -png $(RESUME).pdf > $(RESUME).png

# View the resume pdf.
.PHONY: view_resume
view_resume: $(RESUME).pdf
	evince $(RESUME).pdf

######
# CV #
######

$(CV).tex: $(CV).template.tex $(DATA)
	python render.py

.PHONY: cv
cv: $(CV).pdf cv_png

# Create the cv.pdf
$(CV).pdf: $(CV).tex
	pdflatex $(CV).tex

.PHONY: cv_png
# Make the cv png.
# Make the two pages and append them vertically.
# http://stackoverflow.com/a/31657055/5415895
# http://superuser.com/a/185897
cv_png: $(CV).pdf
	pdftoppm -png $(CV).pdf $(CV)
	python concat.py

.PHONY: view_cv
# View the cv.
view_cv: $(CV).pdf
	evince $(CV).pdf


.PHONY: clean
# Remove output files.
clean:
	rm -rf *.aux *.out *.log $(CV)-*.png *.pyc $(RESUME).tex $(CV).tex