FROM free5gc/upf:v3.4.1

RUN apt-get update && apt-get install -y vim strace net-tools curl netcat-openbsd iproute2 traceroute iperf3 tshark
