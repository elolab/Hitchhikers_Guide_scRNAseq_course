# Base image from Docker Hub:
FROM rocker/tidyverse:4.1.0

# Install Seurat R package and (system) dependencies based on 'Dockerfile' (lates - 22/03/2023): 
#https://github.com/satijalab/seurat-docker/blob/master/latest/Dockerfile
# Set global R options
RUN echo "options(repos = 'https://cloud.r-project.org')" > $(R --no-echo --no-save -e "cat(Sys.getenv('R_HOME'))")/etc/Rprofile.site
ENV RETICULATE_MINICONDA_ENABLED=FALSE

# Install Seurat's system dependencies
RUN apt-get update
RUN apt-get install -y \
   build-essential \
   libglpk40 \
   libcairo2-dev libxt-dev \
   libhdf5-dev \
   libcurl4-openssl-dev \
   libssl-dev \
   libpng-dev \
   libboost-all-dev \
   libxml2-dev \
   openjdk-8-jdk \
   python3-dev \
   python3-pip \
   wget \
   git \
   libfftw3-dev \
   libgsl-dev \
   pkg-config \
   llvm-10 \ 
   libgeos-dev \
   cmake

# Install UMAP
RUN LLVM_CONFIG=/usr/lib/llvm-10/bin/llvm-config pip3 install llvmlite
RUN pip3 install numpy
RUN pip3 install umap-learn
# Install FIt-SNE
RUN git clone --branch v1.2.1 https://github.com/KlugerLab/FIt-SNE.git
RUN g++ -std=c++11 -O3 FIt-SNE/src/sptree.cpp FIt-SNE/src/tsne.cpp FIt-SNE/src/nbodyfft.cpp  -o bin/fast_tsne -pthread -lfftw3 -lm
# Install bioconductor dependencies & suggests
RUN R --no-echo --no-restore --no-save -e "install.packages('BiocManager')"
RUN R --no-echo --no-restore --no-save -e "BiocManager::install(c('multtest', 'S4Vectors', 'SummarizedExperiment', 'SingleCellExperiment', 'MAST', 'DESeq2', 'BiocGenerics', 'GenomicRanges', 'IRanges', 'rtracklayer', 'monocle', 'Biobase', 'limma', 'glmGamPoi'))"
# Install CRAN suggests
RUN R --no-echo --no-restore --no-save -e "install.packages(c('VGAM', 'R.utils', 'metap', 'Rfast2', 'ape', 'enrichR', 'mixtools'))"
# Install spatstat
RUN R --no-echo --no-restore --no-save -e "install.packages(c('spatstat.explore', 'spatstat.geom'))"
# Install hdf5r
RUN R --no-echo --no-restore --no-save -e "install.packages('hdf5r')"
# Install latest Matrix
Run R --no-echo --no-restore --no-save -e "remotes::install_github('cran/Matrix@8f0083c101114457cf9f9a00dc7cd8420b4c89a2')"
# Install rgeos
RUN R --no-echo --no-restore --no-save -e "install.packages('rgeos')"
# Install Seurat
RUN R --no-echo --no-restore --no-save -e "install.packages('remotes')"
RUN R --no-echo --no-restore --no-save -e "install.packages('Seurat')"
RUN R --no-echo --no-restore --no-save -e "remotes::install_github('satijalab/seurat-wrappers', 'seurat5')"
RUN R --no-echo --no-restore --no-save -e "BiocManager::install('batchelor')"
RUN R --no-echo --no-restore --no-save -e "remotes::install_github('satijalab/seurat-data')"

# Install CellTypist python package and dependencies: 
RUN pip3 install 'matplotlib==3.6.3' 'numpy==1.23.5' 'pandas==1.5.3' 'scanpy==1.9.1' \
    'anndata==0.7.8' 'celltypist==1.3.0' 
RUN R --no-echo --no-restore --no-save -e "BiocManager::install('LoomExperiment')"
RUN R --no-echo --no-restore --no-save -e "remotes::install_github('cellgeni/sceasy')"

# Integration data analysis - Scanorama & Harmony: 
RUN pip3 install scanorama==1.7.3 
RUN R --no-echo --no-restore --no-save -e "install.packages('harmony')"

# Packages to import/convert single-cell data into R: 
RUN R --no-echo --no-restore --no-save -e "install.packages('hexbin')"
RUN R --no-echo --no-restore --no-save -e "BiocManager::install('zellkonverter')"
RUN R --no-echo --no-restore --no-save -e "BiocManager::install('DropletUtils')"

# Visualization
RUN R --no-echo --no-restore --no-save -e "remotes::install_github('jokergoo/ComplexHeatmap')"

# Integration metrics
RUN R --no-echo --no-restore --no-save -e "remotes::install_github('carmonalab/scIntegrationMetrics')"

# Reference-mapping
RUN apt-get install -y libbz2-dev
RUN R --no-echo --no-restore --no-save -e "remotes::install_github('satijalab/azimuth')"
RUN R --no-echo --no-restore --no-save -e "remotes::install_version('matrixStats', version = '1.1.0')"

# Create directory structure & distribute data, scripts, notebooks
RUN mkdir -p /home/rstudio/results /home/rstudio/scripts /home/rstudio/notebooks /home/rstudio/data 
COPY course/hands-on/data/covid.rds course/hands-on/data/ifnb.rds course/hands-on/data/jurkat.rds \
	course/hands-on/data/pbmc3k_panc8.rds course/hands-on/data/pbmcref.rds /home/rstudio/data/
COPY course/hands-on/notebooks/01_cross_tissue_task.Rmd course/hands-on/notebooks/02_ifnb_stimulated_task.Rmd \
	course/hands-on/notebooks/03_cell_lines_task.Rmd course/hands-on/notebooks/04_covid_refmap_task.Rmd /home/rstudio/notebooks/
COPY course/hands-on/scripts/01_create_datasets.R /home/rstudio/scripts/

# Descriptions: 
MAINTAINER António Sousa (aggode@utu.fi)
LABEL Description: The Hitchhikers Guide to scRNA-seq course container
LABEL Author(s): António Sousa (aggode@utu.fi)
LABEL Version 1.0.0
