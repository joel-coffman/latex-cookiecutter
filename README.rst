============
cookiecutter
============

Cookiecutter template for LaTeX package. For more information about
cookiecutter, see https://github.com/cookiecutter/cookiecutter.

The cookiecutter template creates installer (``.ins``) and documented LaTeX
(``.dtx``) files that are used to distribute a LaTeX package. In addition, a
Makefile is provided to extract the package code and to compile the package
documentation.

Usage
-----

Generate a template for a LaTeX package::

    cookiecutter git@github.com:joel-coffman/latex-cookiecutter.git

Answer the prompts regarding the package name, description, and maintainer.

The following resources may be helpful if you new to writing LaTeX packages:

* LaTeX2e for Class and Package Writers ([LaTeX2006]_)
* How to Package Your LaTeX Package ([Pakin2015]_)
* Good things come in little packages: An introduction to writing ``.ins`` and
  ``.dtx`` files ([Pakin2008]_)

References
----------

.. [LaTeX2006] The LaTeX Project, "`LaTeX2e for class and package writers`__,"
   February 2006

.. __: https://www.latex-project.org/help/documentation/clsguide.pdf

.. [Pakin2015] Scott Pakin, "`How to Package Your LaTeX Package`__," September
   2015

.. __: https://ctan.org/pkg/dtxtut

.. [Pakin2008] Scott Pakin, "`Good things come in little packages: An
   introduction to writing .ins and .dtx files`__," *TUGboat*, Volume 29, No.
   2, pp. 305-314, 2008

.. __: http://tug.org/TUGboat/tb29-2/tb92pakin.pdf
