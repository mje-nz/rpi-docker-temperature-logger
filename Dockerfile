FROM armhf/alpine:3.5

RUN buildDeps='build-base python-dev linux-headers' && \
    apk update && \
    apk add $buildDeps python py2-pip py-cffi && \
    pip install smbus-cffi sensor && \
    apk del $buildDeps && rm -rf /var/cache/apk/*
    
