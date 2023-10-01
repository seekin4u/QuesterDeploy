Две папки проекта нужны рядом, в одной директории с этим проектом (в GO это `src`)
/QuesterApi переносит с собой .env файл который нужен для проекта. Порт 3000
Quester морда смотрит на 5000.

docker plugin install --alias hetzner costela/docker-volume-hetzner установка плагина для работы с волюмами

```
$ docker plugin disable hetzner
$ docker plugin set hetzner apikey=<apikey>
$ docker plugin enable hetzner
```
docker-hetzner-api sWFTS0BImw5iOYjWoMpf3XnShe69uZ0AgLMMLkFGAbdodEQ2IUFiIWhPMCQDOigs

//Волюмы пошли в пизду, мерзкая дрянь на хетзнере. Осталось доделать обращение к локальной БД и сохранение хранилища локально

Для пуша имаджа в докер хаб - тегнуть локальный имадж как какую-то версию с названием `questerbe` или `questerfe` и запушить в `nordsofskyrim` репозитории в докерхабе
https://hub.docker.com/repository/docker/nordsofskyrim/questerbe
https://hub.docker.com/repository/docker/nordsofskyrim/questerfe
docker tag [local-image-name]:latest [dockerhubusername]/[quester(be|fe)]:[newversion]
docker tag questerdeploy-front:latest nordsofskyrim/questerfe:1.0 
docker push nordsofskyrim/questerfe:1.0