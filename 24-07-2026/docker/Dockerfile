FROM nginx

RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*

HEALTHCHECK CMD curl --fail http://localhost || exit 1