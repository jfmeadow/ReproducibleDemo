# Reproducible Microbiome Analysis
### created by: James F Meadow (jfmeadow at gmail dot com)
### date: 2014 March 29

-----------

Demo scripts to help learn a few reproducibility techniques using RMarkdown. The results, I have found, are better statistical programming skills, cleaner analysis, transparent reproducibility, and a richer understanding of your own data. 

Data used here are from a subset of the 16S Illumina MiSeq dataset used in Meadow et al. (2014, [Microbiome 2:7](http://www.microbiomejournal.com/content/2/1/7)). That manuscript explored the bacterial communities present on indoor classroom surfaces, and reported that the way we interact with surfaces predicts the bacteria present on those surfaces. 

This whole demo can be downloaded here: [https://github.com/jfmeadow/ReproducibleDemo](https://github.com/jfmeadow/ReproducibleDemo)

### Folders in this demo: 

* `QIIME`: Scripts, data, and output from closed reference OTU picking on demultiplexed sequence data. This depends on MacQIIME (1.8). This folder already contains output, so there is no need to install MacQIIME or QIIME if you are only working through the R analysis. The output included in this folder is required for all further analyses. 
* `reportRmd`: scripts, data, and output of a demo analysis report from the knitr package in R. 
* `manuscriptRmd`: scripts, data, and output of a demo manuscript from the knitr package in R. The output from this script is a fully formatted pdf manuscript that can now be submitted to your journal of choice. 


### Instructions: 

#### Install necessary software: 

* R: All statistical analysis is done in R. Install the latest version here: [http://cran.us.r-project.org/](http://cran.us.r-project.org/)
* RStudio: RStudio has fully integrated the knitr/pandoc/RMarkdown workflow described here, so it makes life easier. Find it free here: [https://www.rstudio.com/](https://www.rstudio.com/). If you have an older version, reinstall it to make sure you are taking advantage of the great new functionalities. 
* MacQIIME: Only necessary if you desire to also reproduce sequence processing steps. If you do not install QIIME or MacQIIME, just skip this step and go straight to RStudio for analysis. If you use QIIME through a server, on Linux, or through a virtual box, you will have to edit the `pickTheseOTUs.sh` script to point to your GreenGenes resources. Install MacQIIME here: [http://www.wernerlab.org/software/macqiime](http://www.wernerlab.org/software/macqiime)
* knitr: This R package does the heavy lifting for integrating analysis, prose, figures, tables and whatnot into a single dynamic document. It is an R package, so it can be installed by using the standard R command: `install.packages('knitr')`
* biom and qiimer packages: These R packages are really nice for inputing QIIME formatted (or any JSON format) files into R. There are plenty of ways to do this, but the demo here uses the biom and qiimer package. 
* Additional R packages: This demo uses a few common R packages. These are easy to install using the same `install.packages` command above: 
  * vegan: ecological multivariate statistics.
  * labdsv: a few more really useful ecology functions. 
* Mou - or any markdown editor. If you are new to markdown, this is a really easy clean free editor that is useful for learning the syntax. This document that you are reading, for example, can be opened and read in Mou. It is only available for mac, but there are many free options for all platforms, and they all work about the same. Download free here: [http://mouapp.com/](http://mouapp.com/). You can learn all about markdown here: [https://daringfireball.net/projects/markdown/](https://daringfireball.net/projects/markdown/)
* LaTeX or some complete LaTeX distribution: This is used to convert to final manuscript outputs. If you already have LaTeX on your machine, RStudio will likely be able to use it. If not, MacTeX is a really easy-to-install distribution for Mac, and it will do anything you need to do here. This is heavy-weight software, so it takes a few minutes to download. Find it here: [http://tug.org/mactex/](http://tug.org/mactex/). If you use Windows, download MikTeX from here: [http://miktex.org/](http://miktex.org/). If you only want to produce markdown, html, or .docx formats, LaTeX is unnecessary. 


#### Run individual parts:

* `QIIME`: If you have MacQIIME 1.8 installed on a Mac, you should be able to open a terminal in this folder and run this command: 

        ./pickTheseOTUs.sh
This will ask if you want to replace the output that is already in there. If yes, enter `1` and press return. The script will pick OTUs against the GreenGenes reference database, and then follow the pipeline to the end output - `otu_table.biom`. The dataset is small (20,000 sequences), so it only takes a few minutes. This OTU table, along with the sample metadata file `map.txt`, will be sourced for all analysis downstream. So if you are not sure you have MacQIIME ready to go, just leave this step alone and go straight to R, since this repository already has finished outputs. 
* `reportRmd`: Example R analysis. This is the sort of document I might produce for collaborators or as a supplementary document to accompany a manuscript, or even as a homework report. It analyzes and outputs all R code within the document. To do this, open the `surfaceDemo.Rmd` file in RStudio, and hit the "Knit HTML" button near the top. This will run through the analysis, and if all goes well, should show you an HTML document of your output. If there are no errors in this output, and there is a figure and a few model output tables near the bottom, then it worked! There is now a `surfaceDemo.html` document in that folder that you can email, tack onto a website, or open in your own internet browser. It also produces `surfaceDemo.md`, which is a markdown document that can also be edited. If you have installed LaTeX, you can also use the 'Knit PDF' button to make a pdf. 
* `manuscriptRmd`: Nearly identical analysis as was done in the `reportRmd`, but without the code output. The result here is a submission-quality manuscript file. So instead of showing exactly the code that was entered, we see only the results we want to include in the manuscript. You will execute this the same way you did for `reportRmd`.


#### A few other resources for reproducible analysis documents: 

* IPython Notebooks: Very nice dynamic python documents. Very similar to what knitr does for R. [http://ipython.org/notebook.html](http://ipython.org/notebook.html)
* Sweave: The original analysis/LaTeX integration. For producing really nice, complex dynamic documents. It comes with every R distribution. More info here: [http://www.stat.uni-muenchen.de/~leisch/Sweave/](http://www.stat.uni-muenchen.de/~leisch/Sweave/)
* Pweave: Pretty much identical to Sweave, but for python instead: [http://mpastell.com/pweave/](http://mpastell.com/pweave/)
* Sweave and Pweave demo/comparison: [http://www.johndcook.com/blog/2012/12/20/basics-of-sweave-and-pweave/](http://www.johndcook.com/blog/2012/12/20/basics-of-sweave-and-pweave/)
* Switching from Sweave to knitr: The knitr package has adopted many Sweave conventions and functionalities. This demo explains the transition: [http://yihui.name/knitr/demo/sweave/](http://yihui.name/knitr/demo/sweave/)













































