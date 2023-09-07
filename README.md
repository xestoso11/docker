
# Encriptado de contraseñas
https://bcrypt-generator.com/

# Generar certificados autofirmados
openssl req -x509 -sha256 -newkey rsa:2048 -keyout xestoso11.key -out xestoso11.crt -days 1024 -nodes
<br>
Los certificados tienen que estar en un carpeta que se llama certs, a la altura del resto de carpetas.

# Comands docker compose
## Levantar y tirar contenedores
docker compose up -d
<br>
docker compose down

## Revisar contenedores que estan levantados
docker ps
<br>
Con -a podemos ver tambien los que estan caidos
<br>
docker ps -a

## Revisar logs de contenedor
La flag -f nos sirve para que se quede revisando el log hasta que encuentre un error como el -f del comando tail de linux
<br>
docker logs -f "container_name"
<br>
Con la flag --tail podemos indicar el numero de lineas que nos muestre
<br>
docker logs -f --tail 100 "container_name"

## Inspecionar conetenedores
docker inspect "container_name"

## Terminal de contenedor como root
docker exec -it -u 0 "container_name" /bin/bash
<br>
docker exec -it -u 0 "container_name" /bin/sh

## Listar todas las networks
docker network ls

## Inspecionar network
docker network inspect "network_name"

## Eliminar network
docker network rm "network_name"

## Listar imagenes
docker image ls
<br>
docker images

## Borra imagenes
docker image rm "imagen_name"

## Borrar imagenes que no estan en uso
docker image prune

## Listar volumenes
docker volume ls

## Borra volumenes
docker volume rm "volumen_name"

## Borrar volumenes que no estan en uso
docker volume prune

## Paquetes para hacer pruebas de conectividad basicas dentro de un contenedor 
apt update && apt install curl -y && apt install iputils-ping -y && apt-get install telnet -y