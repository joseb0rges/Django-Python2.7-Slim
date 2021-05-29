FROM python:2.7-alpine

ENV PYTHONUNBUFFERED=1

RUN adduser -D app

RUN mkdir -p /var/app && \
    chown app:app /var/app && \
    chmod 755 -R /var/app

WORKDIR /var/app

USER app

COPY --chown=app:app requirements.txt .
COPY --chown=app:app activate_this.py /usr/local/lib/python2.7/

RUN pip install --user --ignore-installed -r requirements.txt
