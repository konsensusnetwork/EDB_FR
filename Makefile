MODE = --shell-escape

.PHONY: all
all: bitcoinelegance.pdf

.PHONY: pdf
pdf: bitcoinelegance.pdf

bitcoinelegance.pdf: bitcoinelegance.tex chapters/*.tex
	pdflatex $(MODE) $<
	pdflatex $(MODE) $<

bech01.pdf: bech01.tex chapters/ch01-mythe.tex
	pdflatex $(MODE) $<
	pdflatex $(MODE) $<

bech02.pdf: bech02.tex chapters/ch02-clivages.tex
	pdflatex $(MODE) $<
	pdflatex $(MODE) $<

bech03.pdf: bech03.tex chapters/ch03-origine.tex
	pdflatex $(MODE) $<
	pdflatex $(MODE) $<

bech04.pdf: bech04.tex chapters/ch04-adversaire.tex
	pdflatex $(MODE) $<
	pdflatex $(MODE) $<

bech05.pdf: bech05.tex chapters/ch05-cypherpunks.tex
	pdflatex $(MODE) $<
	pdflatex $(MODE) $<

bech06.pdf: bech06.tex chapters/ch06-cybermonnaie.tex
	pdflatex $(MODE) $<
	pdflatex $(MODE) $<

bech07.pdf: bech07.tex chapters/ch07-propriete.tex
	pdflatex $(MODE) $<
	pdflatex $(MODE) $<

bech08.pdf: bech08.tex chapters/ch08-confirmation.tex
	pdflatex $(MODE) $<
	pdflatex $(MODE) $<

bech09.pdf: bech09.tex chapters/ch09-censure.tex
	pdflatex $(MODE) $<
	pdflatex $(MODE) $<

bech10.pdf: bech10.tex chapters/ch10-determination.tex
	pdflatex $(MODE) $<
	pdflatex $(MODE) $<

bech11.pdf: bech11.tex chapters/ch11-rouages.tex
	pdflatex $(MODE) $<
	pdflatex $(MODE) $<

# bech12.pdf: bech12.tex chapters/ch12-avenir.tex
# 	pdflatex $(MODE) $<
# 	pdflatex $(MODE) $<
#
# beappendix.pdf: beappendix.tex appendix/appendix.tex
# 	pdflatex $(MODE) $<
# 	pdflatex $(MODE) $<

.PHONY: clean
clean:
	$(RM) *.ps *.dvi *.aux *.toc *.idx *.ind *.ilg *.log *.out *.brf *.blg *.bbl *.nav *.snm *.vrb
	$(RM) */*.ps */*.dvi */*.aux */*.toc */*.idx */*.ind */*.ilg */*.log */*.out */*.brf */*.blg */*.bbl */*.nav */*.snm */*.vrb

.PHONY: distclean
distclean: clean
	$(RM) *.pdf
