# Reproducible Microbiome Analysis - Manuscript Demo
### created by: James F Meadow (jfmeadow@gmail.com)
### date: 2014 March 29

-----------

To run this analysis report and create manuscript documents, these files are included: 

* `manuscriptDemo.Rmd`: Verbose R analysis examples. This document is composed of R commands embedded within markdown syntax (Rmarkdown). This is a short version of some of the analyses reported in Meadow et al (2014, [Microbiome 2:7](http://www.microbiomejournal.com/content/2/1/7)). The analysis depends on these files:
  * `../QIIME/otu_table.biom`: The end result of QIIME processing in the `../QIIME` folder. The `../QIIME/pickTheseOTUs.sh` script produced the OTU table. 
  * `../QIIME/map.txt`: Sample metadata for the study. This is the same mapping file used by QIIME to process the sequence data. 

  
This will create the following output: 

* `manuscriptDemo.html`: Primary output document. This is what pops up when you run the script in RStudio. It is a standalone document that can be posted on a website, printed, edited, and it viewed in any browser on any software system. For manuscript preparation, this one is of little value. We are primarily after the markdown document since it can be converted to different formats. 
* `manuscriptDemo.md`: Pure markdown document that includes everything but figures. However, the figures are created and dumped in the `figure` folder, so the markdown document can load them to create other types of output. Since it is markdown syntax, it is a text file that is easily edited, and can be converted to HTML or PDF output. 
* `figure`: Folder that holds all figures created during analysis. To convert markdown to any other format, this folder must come along. So it is sourced in the `makeManuscript.sh` script in the `manuscriptPandoc` folder. 