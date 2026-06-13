# Скрипт для развертывания в Minikube
Write-Host "Запуск Minikube..." -ForegroundColor Cyan

# Запускаем Minikube
minikube start --driver=docker

# Применяем манифесты
kubectl apply -f k8s/namespace.yaml
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

# Ждем готовности подов
Write-Host "Ожидание готовности подов..." -ForegroundColor Yellow
kubectl wait --for=condition=ready pod -l app=fastapi -n shitik-lab --timeout=120s

# Получаем URL
$url = minikube service fastapi-svc -n shitik-lab --url
Write-Host "✅ Сервис доступен по адресу: $url" -ForegroundColor Green
