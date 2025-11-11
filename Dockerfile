FROM python:3.14-slim

# Can optimize image size with env vars, didn't go into it here
ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates tzdata curl && \
    rm -rf /var/lib/apt/lists/*

# Install dependencies for the app
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY sunairio.py .
COPY gunicorn.conf.py .

EXPOSE 8000

# Gunicorn reads gunicorn.conf.py
CMD ["gunicorn", "sunairio:app"]
