# Скрипт для удаления ресурсов из Minikube
Write-Host "Удаление ресурсов из Minikube..." -ForegroundColor Cyan

kubectl delete namespace shitik-lab
minikube stop

Write-Host "✅ Ресурсы удалены" -ForegroundColor Green
