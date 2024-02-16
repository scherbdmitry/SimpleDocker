FROM nginx
WORKDIR /home/
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./mini_server.c /home/mini_server.c
COPY ./run.sh /home/run.sh
RUN apt-get update && apt-get install -y gcc spawn-fcgi libfcgi-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN useradd -d /home/dockle -m -s /bin/bash dockle; \
    chown -R dockle /var/cache/
USER dockle
HEALTHCHECK NONE
ENTRYPOINT [ "sh","./run.sh" ]