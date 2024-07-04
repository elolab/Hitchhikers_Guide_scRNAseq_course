## The Hitchhiker's Guide to scRNA-seq course 

<br>

---

<br>

### Table of contents

   + [Overview](#overview)
   
   + [Outline](#outline)

   + [Course materials](#course-materials)
   
   + [Software requirements](#software-requirements)
   
   + [Target audience](#target-audience)

   + [Pre-requisites](#pre-requisites)
   
   + [Instructor](#instructor)

   + [Disclaimer](#disclaimer)

   + [Acknowledgements](#acknowledgements)


<br>

---

<br>

### Overview

This site serves as a repository for the [course materials](#course-materials) provided on the second day of the course [The Hitchhiker's Guide to scRNA-seq](https://www.medicina.ulisboa.pt/en/hitchhikers-guide-scrna-seq) (08-12/07/2024, iMM, Lisbon, Portugal), which focuses on the integration of single-cell RNA sequencing data. 

The [course materials](#course-materials) utilize minimalistic, publicly available scRNA-seq datasets to evaluate the performance of various integration methods across three tasks: (1) cross-tissue, (2) biological conditions, and (3) cell lines. The course addresses the challenges of integration, highlighting the strengths and weaknesses of different methods applied to these tasks. Additionally, a practical example of reference mapping is demonstrated by classifying and projecting PBMCs from two COVID-19 patients onto a previously annotated PBMC reference.

<br>

---

<br>

### Outline

The timeline for the second day of the course (09/07/2024): 

   + 1st morning session: introduction to integration (_presentation_)
   
   + 2nd morning session: introduction to the practical session & hands-on (notebooks 1-2) 
   
   + 1st afternoon session: continue hands-on (notebooks 2-3) & wrap-up integration analysis sessions
   
   + 2nd afternoon session: hands-on (notebook no. 4) & session's wrap up/conclusions

<br>

---

<br>

### Course materials 

Introduction to integration of scRNA-seq data: 

   + **theoretical**: [presentation](course/presentations/theoretical-introduction.pdf)
   
   + **hands-on**: [presentation](course/presentations/hands-on-introduction.html)


<br>

The course materials include four independent data analysis tasks: 

   1. _Cross-tissue integration task_
   
      + _main goal_: evaluate the performance of different integration methods for a cross-tissue integration task.
      
      + _learning objectives_: joint and integrative scRNA-seq data analysis with `Seurat`.  
      
      + _data_ (`pbmc3k_panc8.rds`): a `Seurat` R object of two data sets - 3k human PBMCs from 10X Genomics and pancreatic islets from indrop1 - retrieved from `SeuratData` package (v.0.2.2.9001).
   
      + _R markdown notebook_: `01_cross_tissue_task.Rmd`
      
      + _vignette_: [01_cross_tissue_task.html](https://elolab.github.io/Hitchhikers_Guide_scRNAseq_course/pages/01_cross_tissue_task.html)
      
      + _estimated computing time_: <7 min
      
      + _estimated memory_: <8 GB
      
<br>      
      
   2. _Ifnb stimulated integration task_
   
      + _main goal_: evaluate the performance of different integration methods for an integration analysis involving different biological conditions.
      
      + _learning objectives_: joint and integrative scRNA-seq data analysis with `Seurat`.  
      
      + _data_ (`ifnb.rds`):  a `Seurat` R object of two human PBMCs data sets - resting/control and interferon-stimulated - retrieved from the R package SeuratData (v.0.2.2.9001).
   
      + _R markdown notebook_: `02_ifnb_stimulated_task.Rmd`
      
      + _vignette_: [02_ifnb_stimulated_task.html](https://elolab.github.io/Hitchhikers_Guide_scRNAseq_course/pages/02_ifnb_stimulated_task.html)

      + _estimated computing time_: <4 min
      
      + _estimated memory_: <8 GB

<br>

   3. _Cell lines integration task_
   
      + _main goal_: evaluate the performance of different integration methods for the integration of cell lines with different proportions.
      
      + _learning objectives_: joint and integrative scRNA-seq data analysis with `Seurat`.  
      
      + _data_ (`jurkat.rds`): a `Seurat` R object comprising three data sets - Jurkat, HEK293T and Jurkat:HEK293T (50:50) - retrieved from 10X genomics and published by [Zheng et al., 2017](https://doi.org/10.1038/ncomms14049).
   
      + _R markdown notebook_: `03_cell_lines_task.Rmd`
      
      + _vignette_: [03_cell_lines_task.html](https://elolab.github.io/Hitchhikers_Guide_scRNAseq_course/pages/03_cell_lines_task.html)

      + _estimated computing time_: <4 min
      
      + _estimated memory_: <8 GB

<br>

   4. _COVID reference-mapping task_
   
      + _main goal_: learn how to perform and evaluate reference-mapping analysis of scRNA-seq data.  
      
      + _learning objectives_: perform and evaluate reference-mapping of scRNA-seq data with `Seurat` and `Azimuth`. 
      
      + _data_ (`covid.rds`): a `Seurat` R object of a COVID-19 PBMCs data set from [Guo et al., 2020](https://doi.org/10.1038/s41467-020-17834-w) retrieved from [cziscience](https://cellxgene.cziscience.com/e/ae5341b8-60fb-4fac-86db-86e49ee66287.cxg)  
   
      + _R markdown notebook_: `04_covid_refmap_task.Rmd`
      
      + _vignette_: [04_covid_refmap_task.html](https://elolab.github.io/Hitchhikers_Guide_scRNAseq_course/pages/04_covid_refmap_task.html)

      + _estimated computing time_: <4 min
      
      + _estimated memory_: <8 GB

<br>

The course material for these projects can be found in the following GitHub repository (under the folder `course`): [https://github.com/elolab/Hitchhikers_Guide_scRNAseq_course](https://github.com/elolab/Hitchhikers_Guide_scRNAseq_course).

Download the GitHub repository by typing in the terminal: 
```git clone https://github.com/elolab/Hitchhikers_Guide_scRNAseq_course.git``` 

Alternatively download the GitHub repository by clicking under the [Download ZIP](https://github.com/elolab/Hitchhikers_Guide_scRNAseq_course/archive/refs/heads/master.zip) icon (decompress the folder).

All the data used has been deposited as `Seurat` R objects in **Zenodo**: [https://doi.org/10.5281/zenodo.12620772](https://doi.org/10.5281/zenodo.12620772). 

<br>

---

<br>

### Software requirements

The following software is required in order to reproduce the analyses comprised in the notebooks above (check first if you have these packages installed before try to installing them): 

   + `R programming language` (>=v.4.1.0): [https://www.r-project.org/](https://www.r-project.org/)

<br>

   + `RStudio` (v.1.4.1717© 2009-2021 RStudio, PBC - any version): [https://posit.co/download/rstudio-desktop/](https://posit.co/download/rstudio-desktop/) 

<br>
   
   + `Seurat` (v.5.1.0): [https://satijalab.org/seurat/articles/install_v5](https://satijalab.org/seurat/articles/install_v5)
   
      + command: `install.packages("Seurat")`

<br>
      
   + `remotes` (v.2.5.0 - any version): [https://cran.r-project.org/web/packages/remotes/index.html](https://cran.r-project.org/web/packages/remotes/index.html)
   
      + command: `install.packages("remotes")`

<br>

   + `SeuratWrappers` (v.0.3.2): [https://github.com/satijalab/seurat-wrappers](https://github.com/satijalab/seurat-wrappers) 
   
      + command: `remotes::install_github("satijalab/seurat-wrappers", quiet = TRUE)`

<br>

   + `Azimuth` (v.0.5.0): [https://github.com/satijalab/azimuth](https://github.com/satijalab/azimuth)
   
      + command: `remotes::install_github("satijalab/azimuth", quiet = TRUE)`

<br>

   + `patchwork` (>=v.1.2.0): [https://patchwork.data-imaginist.com](https://patchwork.data-imaginist.com)
   
      + command: `install.packages("patchwork")`

<br>
      
   + `dplyr` (>=v.1.1.4): [https://dplyr.tidyverse.org](https://dplyr.tidyverse.org)
   
      + command: `install.packages("dplyr")`

<br>

   + `scIntegrationMetrics` (v.1.1): [https://github.com/carmonalab/scIntegrationMetrics](https://github.com/carmonalab/scIntegrationMetrics)
   
      + command: `remotes::install_github("carmonalab/scIntegrationMetrics")`

<br>

   + `ComplexHeatmap` (v.2.15.4 - any version): [https://jokergoo.github.io/ComplexHeatmap-reference/book](https://jokergoo.github.io/ComplexHeatmap-reference/book)
   
      + command: `remotes::install_github("jokergoo/ComplexHeatmap")`

<br>

   + `BiocManager` (v.1.30.23): [https://www.bioconductor.org/install](https://www.bioconductor.org/install)
   
      + command: `install.packages("BiocManager")`

<br>

   + `zellkonverter` (v.1.4.0): [https://github.com/theislab/zellkonverter](https://github.com/theislab/zellkonverter)
   
      + command: `BiocManager::install("zellkonverter")`

<br>

   + `matrixStats` (v.1.1.0): [https://cran.rstudio.com/web/packages/matrixStats](https://cran.rstudio.com/web/packages/matrixStats)

      + command: `remotes::install_version("matrixStats", version = "1.1.0")`

<br>

Alternatively you can install docker and pull the image `elolabfi/imm_scrnaseq_course` (7.7 Gb) from DockerHub. This image has all the software mentioned above installed as well as the data, scripts and notebooks to run the materials. 

<br>

#### Ubuntu

In Ubuntu, you can install docker following these instructions: [https://docs.docker.com/desktop/install/ubuntu](https://docs.docker.com/desktop/install/ubuntu)

Once installed, you can run the following command in the terminal after creating the folder `results`:

`mkdir results`

`docker run --rm -ti -e PASSWORD=imm -p 8787:8787 -v $PWD/results:/home/rstudio/results elolabfi/imm_scrnaseq_course:latest`

Then, go to your browser and type: 

`http://localhost:8787`

`# user: rstudio`

`# password: imm`

<br>

#### Other OS

See how to install docker for other OS: [https://www.docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop)

<br>

---

<br>

### Target audience	

Researchers who want to learn how to perform integration and reference-mapping analyses of _single-cell-RNA-seq_ data.

<br>

---

<br>

### Pre-requisites

The course materials are delivered as [R markdown](https://rmarkdown.rstudio.com/) notebooks which can be reproduced with basic-level knowledge of *R programming* language. The participants may benefit from medium-level knowledge of `R` to explore more in-depth some analyses and familiarity with [Seurat](https://satijalab.org/seurat/) object and functionality. 

<br>

---

<br>

### Instructor

**António Sousa** ([ENLIGHT-TEN+](http://www.enlight-ten.eu/) PhD student at the [Medical Bioinformatics Centre](https://elolab.utu.fi/), TBC, University of Turku & Åbo Akademi) 

Contact: <aggode@utu.fi>

<br>

---

<br>

### Disclaimer

>All the data used along each project notebook was made public elsewhere by the respective authors and it has been properly referenced in each project (proper links were provided along each project notebook). The data and tools chosen to address the topic(s) of each project notebook reflect only my personal experience/knowledge and they were chosen to highlight particular aspects that I consider important. The results generated and explored within each project notebook have just the general purpose of give a brief introduction to the topics addressed in each project and do not aim, at any point, to reproduce or question neither the approaches taken nor the main findings published along with the data sets used herein.

<br>

---

<br>

### Acknowledgements

>This project has received funding from the European Union's Horizon 2020 research and innovation programme under the Marie Skłodowska-Curie grant agreement No.: 955321

<br>

![](figs/logos.png)

<br>

<br>

---

<br>

Shield: [![CC BY 4.0][cc-by-shield]][cc-by]

This work is licensed under a
[Creative Commons Attribution 4.0 International License][cc-by].

[![CC BY 4.0][cc-by-image]][cc-by]

[cc-by]: http://creativecommons.org/licenses/by/4.0/
[cc-by-image]: https://i.creativecommons.org/l/by/4.0/88x31.png
[cc-by-shield]: https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg

