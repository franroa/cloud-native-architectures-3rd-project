FROM python:3.7-alpine

WORKDIR .

COPY requirements.txt requirements.txt

RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev

RUN pip install -r requirements.txt

COPY . .
CMD ["python", "consumer.py"]