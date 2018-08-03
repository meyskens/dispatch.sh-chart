ARG ARCH
ARG ARCHREPO
FROM maartje/helmet-controller:${ARCH}-0.0.7 as controller

ARG ARCH
FROM multiarch/alpine:${ARCH}-edge

RUN apk add --no-cache ca-certificates

COPY --from=controller /helmet-controller /usr/local/bin/helmet-controller
COPY ./chart /opt/ontroller/chart
WORKDIR /opt/ontroller

CMD [ "helmet-controller" ]
