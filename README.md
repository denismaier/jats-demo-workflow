# XML Demo Workflow

This repository demonstrates a publishing workflow going from DOCX or ODT to to PDF and HTML using JATS XML as an intermediary format. The final output is produced using ConTeXt (PDF) and XSLT (HTML).

All the necessary commands to perform the conversion are organized in a makefile, i.e. users don't have to worrry about the commande once the templates are implemented.

## Prerequisites

The following tools must be installed:

Pandoc
: available [here](https://pandoc.org/installing.html)

ConTeXt
: available through [TeX Live](https://www.tug.org/texlive/) or from [here](https://wiki.contextgarden.net/ConTeXt_Standalone)

Saxon
: available [here](http://saxon.sourceforge.net/)

Make
: for Windows the easiest option is probably to use [chocolatey](https://chocolatey.org/). Once chocolatey is installed you can simply run `choco install make` from the command line with administrator rights.


## Necessary Files:

(more info  to be added)

makefile

jats.tex

layout.tex

xml2html.xsl

styles.css

## Makefile

(more info  to be added)

## Workflow

(more info  to be added)

These are the steps to process an article:

1. Create a new directory. Place the above mentioned files in this directory. Save `article.docx` (change the name as you like) to this directory.

2. Adjust the `makefile` and `metadata.yaml` as needed.

3. Run `make docx2md` or `make odt2md`.

4. Edit `article-raw.md`. Rename to `article.md` when you are done.

5. `make jats` gives you `article.xml`. 

6. Produce the final output with `make pdf` and `make html`