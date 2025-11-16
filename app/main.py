
---

## 4️⃣ Simple Python App (`app/main.py`, tests, requirements)

**`app/main.py`**

```python
from fastapi import FastAPI
import os

app = FastAPI()

SERVICE_NAME = os.getenv("SERVICE_NAME", "cloud-native-cicd-platform")
VERSION = os.getenv("VERSION", "0.0.1")


@app.get("/health")
def health():
    return {"status": "ok"}


@app.get("/info")
def info():
    return {
        "service": SERVICE_NAME,
        "version": VERSION,
        "environment": os.getenv("ENVIRONMENT", "local"),
    }
