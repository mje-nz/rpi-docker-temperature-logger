FROM armhf/alpine:3.5

RUN buildDeps='build-base python-dev linux-headers' && \
    apk --no-cache add $buildDeps python py2-pip py-cffi && \
    pip --no-cache-dir install smbus-cffi sensor paho-mqtt && \
    apk del $buildDeps
    
