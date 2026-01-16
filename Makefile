LATEXMK ?= latexmk
ENGINE  ?= pdflatex          # pdflatex | xelatex | lualatex
OUTDIR  ?= out

TEXSRC := $(wildcard *.tex)
PDFS   := $(patsubst %.tex,$(OUTDIR)/%.pdf,$(TEXSRC))

.PHONY: all clean

all: $(PDFS)

$(OUTDIR):
	mkdir -p $(OUTDIR)


pandoc:
	pandoc main.md \
		--filter pandoc-include \
		--template=template.tex \
		--pdf-engine=pdflatex \
		-o main.pdf

# Build a PDF into OUTDIR (keeps your project root clean)
$(OUTDIR)/%.pdf: %.tex | $(OUTDIR)
	$(LATEXMK) -$(ENGINE) -interaction=nonstopmode -halt-on-error \
		-outdir=$(OUTDIR) $<

clean:
	$(LATEXMK) -C -outdir=$(OUTDIR) || true
	rm -rf $(OUTDIR)
