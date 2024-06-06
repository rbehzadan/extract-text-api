FROM python:3.12.3 AS builder

COPY requirements.txt .

ENV PATH=/root/.local/bin:$PATH
RUN pip install --user --no-cache-dir -r requirements.txt


FROM python:3.12.3-slim

COPY --from=builder /root/.local /root/.local

RUN apt-get update && \
  apt-get install -yq --no-install-recommends \
  libpq5 \
  && apt-get autoremove -yq && apt-get clean && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

ENV PATH=/root/.local/bin:$PATH


EXPOSE 8080

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080", "--workers", "1"]
