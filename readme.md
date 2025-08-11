Две папки проекта нужны рядом, в одной директории с этим проектом (в GO это `src`)
/QuesterApi переносит с собой .env файл который нужен для проекта. Порт 3000
Quester морда смотрит на 5000.


```
$ docker plugin disable hetzner
$ docker plugin set hetzner apikey=<apikey>
$ docker plugin enable hetzner
```
//docker-hetzner-api (ключу два года и он давно протух)

//Волюмы пошли в пизду, мерзкая дрянь на хетзнере. Осталось доделать обращение к локальной БД и сохранение хранилища локально в волюм но в отдельный

Для пуша имаджа в докер хаб - тегнуть локальный имадж как какую-то версию с названием `questerbe` или `questerfe` и запушить в `nordsofskyrim` репозитории в докерхабе
https://hub.docker.com/repository/docker/nordsofskyrim/questerbe
https://hub.docker.com/repository/docker/nordsofskyrim/questerfe
docker tag 0d8e269243a4f79c4ba8b9a74059a10c0ba19aa7bd7728956ce9a4b5a4800223 [local-image-name]
docker tag [local-image-name]:latest [dockerhubusername]/[quester(be|fe)]:[newversion]

docker tag 0d8e269243a4f79c4ba8b9a74059a10c0ba19aa7bd7728956ce9a4b5a4800223 questerfe
docker tag questerfe:latest nordsofskyrim/questerfe:2.1 
docker push nordsofskyrim/questerfe:2.1
