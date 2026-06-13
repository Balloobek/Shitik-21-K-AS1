# Скрипт для локального запуска FastAPI сервиса
Write-Host "Запуск FastAPI сервиса локально..." -ForegroundColor Cyan

cd app

# Создаем виртуальное окружение
if (-not (Test-Path "venv")) {
    python -m venv venv
    Write-Host "Виртуальное окружение создано" -ForegroundColor Green
}

# Активируем виртуальное окружение
.\venv\Scripts\Activate.ps1

# Устанавливаем зависимости
pip install -r requirements.txt

# Запускаем сервис
uvicorn main:app --reload --host 0.0.0.0 --port 8000
