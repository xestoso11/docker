

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