set -e
docker run -d --name Tester nginx
docker exec Tester ls /usr/share/nginx/html
docker logs Tester
