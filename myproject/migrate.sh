#!/bin/sh

cd /app/

# Apply migrations
/opt/venv/bin/python manage.py collectstatic --noinput
/opt/venv/bin/python manage.py makemigrations --noinput
/opt/venv/bin/python manage.py migrate --noinput