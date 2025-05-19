FROM docker.io/library/debian:bookworm

LABEL name="PGLoader Image" \
      vendor="Tobias Florek" \
      version="${PG_MAJOR}" \
      summary="PGLoader image" \
      description="This Docker image contains PGLoader based on Debian bookworm."

RUN apt-get update \
 && apt-get install -y pgloader \
 && apt-get clean \
 && rm -rf /tmp/* /var/lib/apt/lists/*

RUN useradd -u 1000 pgloader
USER 1000
ENTRYPOINT ["/usr/bin/pgloader"]
