.PHONY: default
default: {{cookiecutter.package_name}}.sty {{cookiecutter.package_name}}.pdf

minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

{{cookiecutter.package_name}}.sty:
{{cookiecutter.package_name}}.pdf: {{cookiecutter.package_name}}.sty | minted

include $(shell git rev-parse --show-toplevel)/Makefile.mk
