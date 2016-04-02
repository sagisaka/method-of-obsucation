TARGET=icis2016_sagisaka
BIBTEX=pbibtex
REFGREP=grep "^LaTeX Warning: Label(s) may have changed."

$(TARGET).pdf: $(TARGET).dvi
	dvipdfmx $(TARGET).dvi

$(TARGET).dvi: $(TARGET).tex $(TARGET).aux $(TARGET).bbl
	(while $(REFGREP) $(TARGET).log; do platex $(TARGET); done)

$(TARGET).bbl: $(TARGET).bib
	$(BIBTEX) $(TARGET)

$(TARGET).aux: $(TARGET).tex
	platex $(TARGET).tex

open: $(TARGET).pdf
	open $(TARGET).pdf

clean:
	rm -f $(TARGET).blg $(TARGET).bbl $(TARGET).dvi $(TARGET).log $(TARGET).aux $(TARGET).lof $(TARGET).lot $(TARGET).toc
