FROM python:3.9-bullseye

WORKDIR /app

RUN apt update && apt install -y \
    git \
    wget \
    pv \
    jq \
    python3-dev \
    ffmpeg \
    mediainfo \
    && rm -rf /var/lib/apt/lists/*

COPY . .

RUN pip install --no-cache-dir -r requirements.txt

CMD ["gunicorn", "app:app"]
