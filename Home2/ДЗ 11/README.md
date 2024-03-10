Запуск:
./run.sh

 Відправлення Docker до реєстру Docker Hub:

docker tag url-shortener:latest your_dockerhub_username/url-shortener:latest
docker push your_dockerhub_username/url-shortener:latest

P.S.
Необхідно впевнитись в наявності та в роботі Docker та Docker Compose.
