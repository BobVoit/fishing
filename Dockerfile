FROM ubuntu:latest

RUN apt update && apt install -y python3 \
    python3-pip

RUN pip3 install jupyter
RUN pip3 install jupyterlab
RUN pip3 install numpy
RUN pip3 install pandas
RUN pip3 install matplotlib

RUN useradd -ms  /bin/bash jupyter
USER jupyter

WORKDIR /project

COPY . .

ENTRYPOINT ["jupyter", "lab", "--ip=*"]