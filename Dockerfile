FROM islasgeci/base:0.7.0
COPY . .
RUN R -e "install.packages(c('data.table', 'devtools', 'optparse', 'reshape2', 'styler', 'tidyverse'), repos = 'http://cran.rstudio.com')"
RUN pip install \
    sqlfluff
