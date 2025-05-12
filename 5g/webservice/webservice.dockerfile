FROM nginx:alpine

RUN apk update && apk add iperf3 traceroute tshark tcpdump
COPY index.html /usr/share/nginx/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
