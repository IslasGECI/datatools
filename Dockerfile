FROM islasgeci/base:82ce
RUN pip install \
    black \
    pytest
COPY . .
