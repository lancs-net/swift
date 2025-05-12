FROM docker.io/library/mongo:7.0.12-jammy

RUN apt update && apt -y upgrade 

RUN apt install -y iproute2

