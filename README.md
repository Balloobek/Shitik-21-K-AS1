# Проект Shitik-21-K-AS1

## Описание
REST сервис на FastAPI, упакованный в Docker, развернутый в Minikube и Yandex Cloud.

## Автор
**Shitik** | Группа: 21-K-AS1

## Быстрый старт

### 1. Локальный запуск
```powershell
cd app
pip install -r requirements.txt
uvicorn main:app --reload
docker build -t shitik-fastapi ./app
docker run -p 8000:8000 shitik-fastapi
minikube start
kubectl apply -f k8s/namespace.yaml
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
minikube service fastapi-svc -n shitik-lab
curl http://localhost:8000
curl http://localhost:8000/health
curl http://localhost:8000/info

```powershell
Write-Host "✅ README.md создан" -ForegroundColor Green
