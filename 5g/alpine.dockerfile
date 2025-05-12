FROM free5gc/n3iwue:v3.4.1

RUN apk update && apk add tshark tcpdump
