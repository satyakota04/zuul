FROM ubuntu:bionic AS builder

RUN apt-get update && apt-get install -y curl git

# Install Go
RUN curl -O https://storage.googleapis.com/golang/go1.15.2.linux-amd64.tar.gz

# Clone repo
RUN git clone https://github.com/prometheus/prometheus.git /app

WORKDIR /app
RUN echo "Change" > change.txt

FROM ubuntu:bionic
COPY --from=builder /app/change.txt /change.txt
