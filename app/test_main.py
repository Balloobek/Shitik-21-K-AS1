from fastapi.testclient import TestClient
from main import app

client = TestClient(app)

def test_root():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json()["message"] == "Hello from Shitik-21-K-AS1!"

def test_health():
    response = client.get("/health")
    assert response.status_code == 200
    assert response.json()["status"] == "ok"

def test_info():
    response = client.get("/info")
    assert response.status_code == 200
    assert response.json()["author"] == "Shitik"
