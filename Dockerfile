FROM python:3.11.3-alpine3.18

ENV PYTHONUNBUFFERED=1

WORKDIR /app

# RUN apk update \
#     && apk add --no-cache gcc musl-dev postgresql-dev python3-dev libffi-dev \
#     && 
# RUN python - m pip install --upgrade pip \
#     && pip install psycopg2==2.9.3

COPY ./requirements.txt ./

RUN pip install -r requirements.txt

COPY ./ ./

CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]