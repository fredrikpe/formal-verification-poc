FROM ubuntu:18.04

RUN  apt-get update \
  && apt-get install -y wget unzip clang build-essential


# Install z3
RUN wget https://github.com/Z3Prover/z3/releases/download/z3-4.8.10/z3-4.8.10-x64-ubuntu-18.04.zip
RUN unzip z3-4.8.10-x64-ubuntu-18.04.zip
RUN cp z3-4.8.10-x64-ubuntu-18.04/bin/* /usr/bin | :
RUN cp z3-4.8.10-x64-ubuntu-18.04/include/* /usr/include
RUN rm -rf z3-4.8.10-x64-ubuntu-18.04/ z3-4.8.10-x64-ubuntu-18.04.zip

RUN wget https://github.com/GaloisInc/saw-script/releases/download/v0.7/saw-0.7-Linux-x86_64.tar.gz
RUN tar xf saw-0.7-Linux-x86_64.tar.gz
RUN cp saw-0.7-Linux-x86_64/bin/* /usr/bin
RUN cp -r saw-0.7-Linux-x86_64/lib/* /usr/lib
RUN rm -rf saw-0.7-Linux-x86_64/ saw-0.7-Linux-x86_64.tar.gz

RUN z3 | :
RUN saw | :

COPY . /app
WORKDIR /app
RUN ls

RUN make saw

