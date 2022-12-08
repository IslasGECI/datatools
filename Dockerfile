FROM islasgeci/robinson_code
COPY . .
RUN apt update && apt install --yes \
    shellcheck
RUN R -e "install.packages(c('data.table', 'optparse', 'reshape2'), repos = 'http://cran.rstudio.com')"
RUN pip install \
    black \
    flake8 \
    sqlfluff \
    typer
