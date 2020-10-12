.PHONY: default
default: $(patsubst %.dtx,%.sty,$(wildcard *.dtx)) \
         $(patsubst %.dtx,%.pdf,$(wildcard *.dtx))

minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

{{cookiecutter.package_name}}.sty:
{{cookiecutter.package_name}}.pdf: {{cookiecutter.package_name}}.sty | minted

include $(shell git rev-parse --show-toplevel)/Makefile.mk
