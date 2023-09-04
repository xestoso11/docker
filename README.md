
# Encriptado de contraseñas
https://bcrypt-generator.com/

# Generar certificados autofirmados
openssl req -x509 -sha256 -newkey rsa:2048 -keyout xestoso11.key -out xestoso11.crt -days 1024 -nodes

# Comands docker compose
## Levantar contenedores
docker compose up -d
<br>
docker compose down

## Revisar contenedores que estan levantados
docker ps

## Revisar contenedores que estan levantados y caidos
docker ps -a

## Revisar logs de contenedor
docker logs -f "container_name"

## Terminal de contenedor como root
docker exec -it -u 0 "container_name" /bin/bash
<br>
docker exec -it -u 0 "container_name" /bin/sh

## Listar todas las networks
docker network inspect

## Inspecionar network
docker network inspect "network_name"

## Eliminar network
ocker network rm "network_name"
