FROM python:3.10-slim-bullseye AS builder

RUN apt-get update \
    && apt-get -y install libpq-dev gcc \
    && pip install psycopg2

COPY requirements.txt .

RUN pip install --user -r requirements.txt

FROM python:3.10-slim
WORKDIR /root/main/projects/Recruto/

COPY --from=builder /root/.local /root/.local
COPY . .

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
