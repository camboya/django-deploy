FROM python:3.9.5
ENV PYTHONUNBUFFERED=1
COPY requirements.txt .
RUN pip install -r requirements.txt
WORKDIR /opt/back_end
COPY . /opt/back_end
ENV POSTGRES_DB=marvel_db
ENV POSTGRES_USER=inove_user
ENV POSTGRES_PASSWORD=123Marvel!
ENV POSTGRES_HOST=db
ENV DEBUG=False
ENV SECRET_KEY=django-insecure-$dpguq$#6!6dw($(qd6))7qcw%%#a=sc!-!7t!_av9%5*(q=uf
RUN python marvel/manage.py collectstatic --noinput
CMD gunicorn --chdir /opt/back_end/marvel marvel.wsgi:application --bind 0.0.0.0:$PORT