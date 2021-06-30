# use Bash as the shell when interpreting the Makefile
SHELL := /bin/bash

.PHONY: all
all: packages documentation

packages = $(patsubst %.dtx,%.sty,$(wildcard *.dtx))
documentation = $(patsubst %.dtx,%.pdf,$(wildcard *.dtx))

.PHONY: packages
packages: $(packages)

.PHONY: documentation
documentation: $(documentation)

minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

$(documentation): | minted

# add texmf directory to TEXINPUTS environment variable to find included files
# (e.g., packages)
TEXINPUTS := .:$(TEXINPUTS):./texmf//:

# define TEX as pdflatex
TEX=TEXINPUTS=$(TEXINPUTS) pdflatex -shell-escape

%.pdf: %.dtx %.sty $(wildcard *.bib) $(wildcard *.tex) .version.tex
	$(TEX) -draftmode $<
	if [ -f $*.idx ]; then makeindex -s gind.ist -o $*.ind $*.idx; fi
	if [ -f $*.glo ]; then makeindex -s gglo.ist -o $*.gls $*.glo; fi
	$(TEX) $<
	while ( grep -q '^LaTeX Warning: Label(s) may have changed' $*.log ) do \
	    $(TEX) $<; \
	done

%.sty: %.ins %.dtx
	$(TEX) -draftmode $<


derivatives += *.aux *.glo *.gls *.idx *.ilg *.ind *.log *.out

.PHONY: mostlyclean
mostlyclean:
	$(RM) $(derivatives)

.PHONY: clean
clean: mostlyclean
	$(RM) $(documentation) $(packages)


package ?= \
        $(wildcard *.dtx) \
        $(wildcard *.ins) \
        $(patsubst %.dtx,%.pdf,$(wildcard *.dtx)) \
        $(wildcard README)

archive ?= $(patsubst %.dtx,%.zip,$(wildcard *.dtx))
# multiple packages (i.e., bundle) => use the directory as the package name
ifneq ($(words $(archive)),1)
archive = $(notdir $(CURDIR)).zip
endif

# target-specific variables
%.zip: directory := $(shell mktemp --directory)
%.zip: package_name = $(basename $@)

%.zip: $(package)
	mkdir $(directory)/$(package_name)
	cp $(package) $(directory)/$(package_name)
	cd $(directory) && zip -r $@ $(package_name)
	mv $(directory)/$@ $@
	$(RM) --recursive $(directory)

.PHONY: dist
dist: $(archive)

.PHONY: distcheck
distcheck: dist
	unzip -l $(archive) | grep '$(basename $(archive))/$$'  # package directory
	unzip -l $(archive) | grep '\.dtx$$'  # documented LaTeX (source)
	unzip -l $(archive) | grep '\.ins$$'  # installer
	unzip -l $(archive) | grep '\.pdf$$'  # documentation

_dist_derivatives += $(archive)

.PHONY: distclean
distclean: clean
	$(RM) $(_dist_derivatives)


ifneq ($(shell git rev-parse --show-toplevel 2> /dev/null),)
VERSION:=$(shell git describe --abbrev=12 --always --dirty=+)
endif

.PHONY: version
version:
	@echo $(VERSION)

.PHONY: .version
.version:
	[ -f $@.tex ] || touch $@.tex
	echo "$(VERSION)" \
	        | sed 's/.*/\\providecommand{\\version}{&}/' > $@.tex~
	cmp -s $@.tex $@.tex~ || mv $@.tex~ $@.tex
	$(RM) $@.tex~

.version.tex: .version
