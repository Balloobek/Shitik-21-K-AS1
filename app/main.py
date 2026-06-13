"""
FastAPI сервис для демонстрации развертывания
Автор: Shitik
Группа: 21-K-AS1
"""

from fastapi import FastAPI
import datetime
import os

app = FastAPI(
    title="Shitik-21-K-AS1 Service",
    description="Простой REST API для проверки деплоя",
    version="1.0.0"
)

request_counter = 0

@app.get("/")
def root():
    global request_counter
    request_counter += 1
    
    return {
        "message": "Hello from Shitik-21-K-AS1!",
        "timestamp": datetime.datetime.now().isoformat(),
        "request_number": request_counter,
        "hostname": os.getenv("HOSTNAME", "local")
    }

@app.get("/health")
def health_check():
    return {
        "status": "ok",
        "service": "fastapi-demo",
        "version": "1.0.0"
    }

@app.get("/info")
def info():
    return {
        "author": "Shitik",
        "group": "21-K-AS1",
        "technology": "FastAPI",
        "endpoints": ["/", "/health", "/info"]
    }
