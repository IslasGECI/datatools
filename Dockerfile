FROM islasgeci/base:latest
COPY . .
RUN apt update && apt install --yes \
    shellcheck
RUN R -e "install.packages(c('data.table', 'devtools', 'optparse', 'reshape2'), repos = 'http://cran.rstudio.com')"
RUN pip install \
    sqlfluff
