# Makefile
# 
# Demo Workflow for JATS XML to HTML and PDF production using XSLT and ConTeXt <www.contextgarden.net> ????????
# Source preparation from DOCX or ODT using Pandoc
# <http://johnmacfarlane.net/pandoc/> 
#
# Run "make docx2md" to produce markdown from docx
#
# Run "make odt2md" to produce markdown from odt
#
# Run "make jats" to produce a JATS XML file based on the intermediary markdown file
#
# Run "make pdf" to produce a PDF from JATS XML with ConTeXt


# Filename (without extension)

basename=article

# ConTeXt layout (change this for different layout settings according to type of article)
context-layout=layout


# Pandoc basic settings

pandoc=pandoc
datadir=


# Pandoc options

general_options= --standalone 

# Pandoc to Markdown Options

markdown_options=--to markdown --atx-headers


# Pandoc to JATS XML Options 
# If need a custom JATS template use this option --template-file=

jats-metadata=metadata.yaml
jats_options=--to jats --metadata-file=$(jats-metadata)



# Saxon Options
# We use Saxon to convert to HTML
# Demo command: java -jar c:\saxon\saxon9he.jar -s:source.xml -xsl:rules.xsl -o:output.html

java=java -jar
saxon=dir/saxon9he.jar
XSL=xml2html.xsl

saxon_option= -s:$(basename).xml -o:$(basename).html -xsl:$(XSL)


# Rules

docx2md: 
	$(pandoc) $(general_options) $(markdown_options) -o $(basename)-raw.md $(basename).docx

odt2md: 
	$(pandoc) $(general_options) $(markdown_options) -o $(basename)-raw.md $(basename).odt

jats: 
	$(pandoc) $(general_options) $(jats_options) -o $(basename).xml $(basename).md
	
html: 
	$(java) $(saxon) $(saxon_options) -o $(basename).xml $(basename).xml

pdf:
	context $(basename).xml --environment=jats,$(context-layout)