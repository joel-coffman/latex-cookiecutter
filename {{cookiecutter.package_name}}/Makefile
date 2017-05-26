.PHONY: default
default: minted {{cookiecutter.package_name}}.sty {{cookiecutter.package_name}}.pdf

.PHONY: minted
minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

include ../Makefile.mk
