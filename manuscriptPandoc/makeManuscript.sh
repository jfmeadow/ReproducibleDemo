#!/bin/bash

export mainFile=manuscriptDemo
export bibFile=surfaceDemo
export fromPath=../manuscriptRmd/


# update bib file - This is really useful when using a citation editor 
#   like Mendeley that updates bib files when you manage citations. 
# cp ~/Documents/bib/$bibFile.bib .

# copy figures from Rmd folder
#   knitr generated these, and they will be included in the documents.
cp -r $fromPath/figure .

# produces latex source document
pandoc -f markdown -t latex $fromPath$mainFile.md -o $mainFile.tex

# produces default latex pdf with no citations
# pandoc $fromPath$mainFile.md -o $mainFile.pdf

# produces formated latex pdf with no citations.
# pandoc $fromPath$mainFile.md -o $mainFile.pdf -H margins.sty

# produces default latex pdf with generic tex citations
pandoc $fromPath$mainFile.md -o $mainFile\Plain.pdf --bibliography $bibFile.bib 

# produces formated latex with generic tex citations
# pandoc $fromPath$mainFile.md -o $mainFileGenCites.pdf --bibliography $bibFile.bib -H margins.sty

# produces pnas citations.
pandoc $fromPath$mainFile.md -o $mainFile\PNAS.pdf --bibliography $bibFile.bib --csl pnas.csl -H margins.sty

# produces PLOS citations.
pandoc $fromPath$mainFile.md -o $mainFile\PLOS.pdf --bibliography $bibFile.bib --csl plos.csl -H margins.sty


# produces docx with citations.
#   this can also take a docx template for better formatting 
pandoc $fromPath$mainFile.md -t docx -o $mainFile.docx --bibliography $bibFile.bib --csl plos.csl

# produces docx without citations.
# pandoc $fromPath$mainFile.md -t docx -o $mainFile.docx
