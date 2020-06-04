FROM islasgeci/base:82ce
RUN R -e "install.packages(c('covr', 'testthat'), repos='http://cran.rstudio.com')"
RUN pip install pytest
COPY . .
