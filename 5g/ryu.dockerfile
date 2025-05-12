FROM docker.io/debian

RUN apt-get update -q && \
  DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -yq \
  python3 \
  python3-pip \
  python3-setuptools

RUN pip install ryu --break-system-packages
RUN ryu-manager 
  
