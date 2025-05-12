ARG PYTHON_VERSION=3.9
FROM python:${PYTHON_VERSION}-alpine

COPY ./requirements.txt .
RUN pip install -r ./requirements.txt

RUN apk add bash

RUN apk add --no-cache --virtual .build-deps \
    gcc \
    g++ \
    musl-dev

RUN pip install eventlet==0.30.2 && \
    pip install setuptools==59.5.0

ARG RYU_VERSION=4.34
RUN pip install ryu==${RYU_VERSION}

RUN apk del .build-deps

WORKDIR /
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

WORKDIR /workspace
ENTRYPOINT [ "bash", "/entrypoint.sh" ]
CMD [ "--help" ]
