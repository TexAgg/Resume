TEXFILE=main

$(TEXFILE).pdf: $(TEXFILE).tex
	pdflatex $(TEXFILE)

web:
	htlatex $(TEXFILE).tex

clean:
	del *.aux *.blg *.out *.bbl *.log $(TEXFILE).run.xml $(TEXFILE)-blx.bib $(TEXFILE).4tc $(TEXFILE).dvi $(TEXFILE).xref $(TEXFILE).4ct *.lg *.tmp *.idv

view: $(TEXFILE).pdf
	$(TEXFILE).pdf &