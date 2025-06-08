FROM python:3.11-slim

RUN apt-get update && \
    apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_20.x  | bash - && \
    apt-get install -y nodejs

WORKDIR /app
RUN pip install mcpo uv
COPY config.json /app/

CMD ["mcpo","--config", "/app/config.json"]