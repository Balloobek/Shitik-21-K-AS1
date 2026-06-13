# Скрипт для сборки и запуска Docker контейнера
Write-Host "Сборка Docker образа..." -ForegroundColor Cyan

# Собираем образ
docker build -t shitik-fastapi ./app

# Останавливаем и удаляем старый контейнер, если есть
docker stop shitik-app 2>$null
docker rm shitik-app 2>$null

# Запускаем новый контейнер
docker run -d -p 8000:8000 --name shitik-app shitik-fastapi

Write-Host "✅ Сервис запущен на http://localhost:8000" -ForegroundColor Green
Write-Host "Для остановки выполните: docker stop shitik-app && docker rm shitik-app" -ForegroundColor Yellow
