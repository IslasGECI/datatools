FROM islasgeci/base:82ce
RUN pip install \
    black \
    pytest
COPY . .

RUN git clone https://github.com/bats-core/bats-core.git && \
    cd bats-core && \
    ./install.sh /usr/local