FROM arm32v6/alpine:3.6

RUN buildDeps='build-base python-dev linux-headers' && \
    apk --no-cache add $buildDeps python py2-pip py-cffi && \
    pip --no-cache-dir install smbus-cffi sensor paho-mqtt && \
    apk del $buildDeps

ADD "main.py" /
# 114 is i2c group on OSMC
RUN addgroup -g 114 i2c && adduser -S -G i2c temp-logger
USER temp-logger
CMD ["python", "/main.py"]
