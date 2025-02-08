# Download base image ubuntu 24.04
FROM ubuntu:24.10

RUN apt-get update && \
    apt-get install -y git make cmake perl unzip g++ dos2unix curl time rsync nano sysvbanner \
                       lzma glibc-source wget gawk \
                       gputils byacc bison flex libboost-all-dev texinfo && \
    apt-get clean

ENV PATH="/mount:${PATH}"

WORKDIR "/root"

CMD ["/bin/bash"]
