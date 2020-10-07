FROM islasgeci/base:82ce

RUN R -e "install.packages(c('devtools', 'optparse', 'data.table'), repos = 'http://cran.rstudio.com')"
RUN R -e "devtools::install_github('klutometis/roxygen', upgrade = FALSE)"
RUN pip install \
    black \
    pytest
COPY . .

RUN git clone https://github.com/bats-core/bats-core.git && \
    cd bats-core && \
    ./install.sh /usr/local