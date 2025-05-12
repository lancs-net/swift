FROM free5gc/n3iwue:v3.4.1

RUN apt-get update && apt-get install -y vim \
	strace \
	net-tools \
	curl \
	netcat-openbsd \
	iproute2 \
	traceroute \
	iperf3 \
	tshark \
	tcpdump
