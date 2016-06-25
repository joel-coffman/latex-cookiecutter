.PHONY: default
default: minted {{cookiecutter.package_name}}.sty

.PHONY: minted
minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

include ../Makefile.mk
