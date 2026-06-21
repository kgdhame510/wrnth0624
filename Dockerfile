FROM alpine:3.20

RUN apk add --no-cache wget tar

WORKDIR /app

COPY NOTICE.txt .

RUN wget https://github.com/SagerNet/sing-box/releases/download/v1.13.13/sing-box-1.13.13-linux-amd64.tar.gz && \
    tar -zxvf sing-box-1.13.13-linux-amd64.tar.gz && \
    mv sing-box-1.13.13-linux-amd64/sing-box ./ && \
    rm -rf sing-box-1.13.13-linux-amd64*

COPY config.json .

EXPOSE 8080 8081

CMD ["./sing-box", "run", "-c", "config.json"]
