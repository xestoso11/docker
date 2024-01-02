

# Aumentar vm.max_map_count para que no de error el opensearch o elastick

## Sin persistir
Cuando se reinicie o apage la máquina lo habra que volver a hacer
<br>
sysctl -w vm.max_map_count=262144 

## Para que se persista
### Agregar siguiente linea en /etc/sysctl.conf
echo "vm.max_map_count=262144" >> /etc/sysctl.conf
### Reiniciar parametros del kernel
sudo sysctl -p
### Verificar que se realizo correctamente
cat /proc/sys/vm/max_map_count

# Rotado indices Opensearch
En la carpeta rotado_indices hay un script que sirve para el rotado de los indices de opensearch .


<br>
Se necesitan que esten instalados los comandos "date", "grep", "awk", "cat", "curl" y que el formato de los indices sea el siguiente "logshtash-logs-año.mes.dia" las fechas en números, si tiene otro formato este script no servira.

