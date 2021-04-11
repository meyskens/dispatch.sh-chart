FROM ghcr.io/meyskens/helmet-controller:0.0.18 as controller

FROM alpine:3.13

RUN apk add --no-cache ca-certificates

COPY --from=controller /helmet-controller /usr/local/bin/helmet-controller
COPY ./chart /opt/ontroller/chart
WORKDIR /opt/ontroller

CMD [ "helmet-controller" ]
