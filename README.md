# Resume
My resume and cv, written in LaTeX.
Uses the [moderncv](https://vic.demuzere.be/articles/curriculum-vitae-cv-with-latex-moderncv/) template,
and Python with [Jinja2](http://jinja.pocoo.org/docs/dev/) for templating.

---

## Building
Requires [GNU Make](https://www.gnu.org/software/make/), poppler-utils,
ImageMagick, Python 2, and
[pdfLaTeX](http://tex.stackexchange.com/questions/49569/where-to-download-pdflatex-exe).

Run 
```
make
```
to make all the targets.

## Other resources
[This website](https://www.pdftoword.com/) can convert a pdf to word, in case a plaintext version is needed (running Pandoc produces an empty file).