FROM python:3.7

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
RUN pip install --upgrade pip Flask==0.10.1 uwsgi requests redis
WORKDIR /app
COPY app /app
COPY cmd.py /

EXPOSE 9090 9191
USER uwsgi
CMD ["/cmd.py"]
#CMD ["uwsgi", "--http", "0.0.0.0:9090", "--wsgi-file", "/app/identidock.py", "--callable", "app", "--stats", "0.0.0.0:9191"]
