ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --no-cache \
    ser2net


# COPY rootfs /

# WORKDIR /

COPY run.sh /

CMD [ "/run.sh" ]