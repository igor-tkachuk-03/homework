# Використовуємо офіційний образ Python
FROM python:3.9-slim

# Встановлюємо необхідні залежності
RUN apt-get update && apt-get install -y gcc libpq-dev && rm -rf /var/lib/apt/lists/*

# Створюємо та встановлюємо робочий каталог
WORKDIR /app

# Копіюємо файли залежностей та встановлюємо їх
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Копіюємо весь вміст поточного каталогу у робочий каталог
COPY . .

# Виконуємо команду для запуску сервера
CMD ["python", "app.py"]
