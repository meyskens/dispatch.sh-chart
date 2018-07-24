ARG ARCH
FROM maartje/helmet-controller:${ARCH}-0.0.6 as controller

ARG ARCHREPO
FROM ${ARCHREPO}/alpine:edge

RUN apk add --no-cache ca-certificates

COPY --from=controller /helmet-controller /usr/local/bin/helmet-controller
COPY ./chart /opt/ontroller/chart
WORKDIR /opt/ontroller

CMD [ "helmet-controller" ]
