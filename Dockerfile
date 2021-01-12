FROM islasgeci/base:82ce

RUN R -e "install.packages(c('data.table', 'devtools', 'optparse', 'styler', 'tidyverse'), repos = 'http://cran.rstudio.com')"
RUN pip install \
    black \
    pytest
COPY . .

RUN git clone https://github.com/bats-core/bats-core.git && \
    cd bats-core && \
    ./install.sh /usr/local