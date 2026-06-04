FROM python:3.11-slim

WORKDIR /app

RUN apt-get update \
  && apt-get install -y --no-install-recommends libgomp1 \
  && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY main.py .

# Pre-download U2-Net model during build to reduce startup memory
RUN python -c "from rembg import new_session; new_session('u2net')"

ENV PORT=10000
CMD uvicorn main:app --host 0.0.0.0 --port ${PORT}
