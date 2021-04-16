FROM ghcr.io/meyskens/helmet-controller:0.0.20 as controller

FROM alpine:3.13

RUN apk add --no-cache ca-certificates

COPY --from=controller /helmet-controller /usr/local/bin/helmet-controller
COPY ./chart /opt/controller/chart
WORKDIR /opt/controller

CMD [ "helmet-controller" ]
