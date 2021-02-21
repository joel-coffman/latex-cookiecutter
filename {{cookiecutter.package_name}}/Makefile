.PHONY: default
default: packages documentation

packages = $(patsubst %.dtx,%.sty,$(wildcard *.dtx))
documentation = $(patsubst %.dtx,%.pdf,$(wildcard *.dtx))

.PHONY: packages
packages: $(packages)

.PHONY: documentation
documentation: $(documentation)

minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

$(documentation): %.sty | minted

include $(shell git rev-parse --show-toplevel)/Makefile.mk
