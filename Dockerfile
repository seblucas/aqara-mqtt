FROM seblucas/alpine-python3:latest

ENV LIBRARY_PATH=/lib:/usr/lib

ADD src/requirements.txt /
RUN apk add --no-cache --virtual=build-dependencies build-base linux-headers python3-dev && \
    pip3 install -r /requirements.txt && \
    apk del build-dependencies && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/*

WORKDIR /app
COPY src /app

CMD ["python3", "-u", "/app/main.py"]
