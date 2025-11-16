# ====== Builder stage ======
FROM python:3.11-slim AS builder

WORKDIR /app

COPY app/requirements.txt .
RUN pip install --user -r requirements.txt

COPY app/ ./app

# Run tests
RUN python -m pytest app/tests

# ====== Runtime stage ======
FROM python:3.11-slim

ENV PATH=/root/.local/bin:$PATH
WORKDIR /app

COPY --from=builder /root/.local /root/.local
COPY app/ ./app

EXPOSE 8000
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
