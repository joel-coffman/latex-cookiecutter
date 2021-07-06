# use Bash as the shell when interpreting the Makefile
SHELL := /bin/bash

.PHONY: all
all: cookiecutter

.PHONY: cookiecutter
cookiecutter: directory := $(shell mktemp --directory)
cookiecutter:
	cookiecutter --no-input --output-dir=$(directory) .
	$(MAKE) --directory=$(directory)/package
	$(MAKE) --directory=$(directory)/package dist distcheck
	$(RM) --recursive $(directory)
