FROM islasgeci/base:82ce

RUN R -e "install.packages(c('data.table', 'devtools', 'optparse', 'styler', 'tidyverse'), repos = 'http://cran.rstudio.com')"
RUN pip install \
    black \
    git+https://github.com/IslasGECI/analytictools.git@efbf1c4b4f5446643b697488256d9432ba55661a \
    pytest \
    utm
COPY . .

RUN git clone https://github.com/bats-core/bats-core.git && \
    cd bats-core && \
    ./install.sh /usr/local