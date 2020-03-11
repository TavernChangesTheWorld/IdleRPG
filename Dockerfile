FROM tavernsws/python:latest

WORKDIR /idlerpg
COPY requirements.txt .

RUN apk add --no-cache curl git && \
    curl -sL https://raw.githubusercontent.com/TavernChangesTheWorld/alpine-python-wheels/3.9/index-order | while read p; do pip install "https://github.com/TavernChangesTheWorld/alpine-python-wheels/raw/3.9/wheels/$p"; done && \
    apk del curl

COPY . .

CMD python launcher.py
