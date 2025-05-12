FROM free5gc/webui:v3.4.1

RUN apt-get update && apt-get install -y vim strace net-tools curl netcat-openbsd iproute2

