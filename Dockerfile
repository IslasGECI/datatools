FROM islasgeci/base:82ce
RUN pip install pytest
COPY . .
