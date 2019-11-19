# XML Demo Workflow

This repository demonstrates a publishing workflow going from DOCX or ODT to to PDF and HTML using JATS XML as an intermediary format. The final output is produced using ConTeXt (PDF) and XSLT (HTML).

All the necessary commands to perform the conversion are neatly organized in a makefile, i.e. users don't have to worrry about the commande once the templates are implemented.

Makefile beschreiben...

ConTeXt templates beschreiben (2 Templates, JATS mapping und layout)

Ablauf:

1. Make markdwon

2. make jats

3. make pdf / make html; was man halt will...