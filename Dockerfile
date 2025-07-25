FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
  python3.10 \
  python3.10-venv \
  python3-pip \
  git

RUN python3.10 -m venv / venv \
  && /venv/bin/pip install --upgrade pip \
  && /venv/bin/pip install pyYAML

ENV PATH="/venv/bin:$PATH"

COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
