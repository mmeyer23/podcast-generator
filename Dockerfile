FROM python:3.10-slim

RUN apt-get update && apt-get install -y git

RUN python -m venv /venv \
  && /venv/bin/pip install --upgrade pip \
  && /venv/bin/pip install pyYAML

ENV PATH="/venv/bin:$PATH"

COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
