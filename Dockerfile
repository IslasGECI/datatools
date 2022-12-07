FROM islasgeci/base:1.0.0
COPY . .
RUN apt update && apt install --yes \
    shellcheck
RUN R -e "install.packages(c('data.table', 'optparse', 'reshape2'), repos = 'http://cran.rstudio.com')"
RUN R -e "remotes::install_github('IslasGECI/robinson_code', build_vignettes=FALSE, upgrade = 'always')"
RUN pip install \
    black \
    flake8 \
    sqlfluff \
    typer
