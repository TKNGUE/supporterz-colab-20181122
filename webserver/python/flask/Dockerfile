FROM library/python:3.7

RUN pip install pipenv

# Locale
WORKDIR /opt/src
ADD ./src/Pipfile ./
ADD ./src/Pipfile.lock ./

RUN pipenv sync

ADD ./src/ ./

ENV FLASK_ENV development
ENV FLASK_APP ./app/app.py

EXPOSE 8080
ENTRYPOINT ["pipenv", "run", "python", "-m", "flask", "run"]
CMD ["-h", "0.0.0.0", "-p", "8080"]
