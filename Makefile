TEXFILE=main

$(TEXFILE).pdf: $(TEXFILE).tex
	pdflatex $(TEXFILE)

clean:
	del *.aux *.blg *.out *.bbl *.log $(TEXFILE).run.xml $(TEXFILE)-blx.bib

view: $(TEXFILE).pdf
	$(TEXFILE).pdf &