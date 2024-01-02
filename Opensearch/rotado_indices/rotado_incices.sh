#!/bin/bash

##Variables a cambiar
# En la variable diasrm se indica los días que queremos que nos mantenga los datos
# los que sean más antiguos de 15 días se borraran.

diasrm=15

## Lista todos los indices que hay en opensearch

# Hace un get a el node de opensearch para sacar los indices y los guarda en el archivo indices
curl "https://localhost:9200/_cat/indices?v" --insecure --user "admin:admin" > indices.tmp
# Se queda con la 3 columa de el archivo indices.tmp que es la que contienen el nombre de los indices
cat indices.tmp | awk '{print $3}' > indice.tmp
# Se queda solo con los indices que nos interesan y borra el archivo indices.tmp y le inserta estes nuevos datos
grep logshtash-logs-* indice.tmp > indices.tmp

## Borrado de indices

# esta variable es la encargada de selecionar la fecha en el formato que queremos para despues usarla para comparar y eliminar 
dia=$(date +"%Y.%m.%d" --date "$diasrm day ago")

# se recorre el archivo indices.tmp selecionando la columna 3 que es donde esta la fecha de nuestro archivo
for i in $(cat indices.tmp | awk -F '-' '{print $3}')
do
    # Se compara para saber si la fecha del indice es más antigua a la que tenemos para que se borre
    if [[ "$dia" > "$i" ]]
        curl -XDELETE "https://localhost:9200/logshtash-logs-$i" --insecure --user "admin:admin"
    else
        echo " "
    fi
done

## Borrado de archivos temporales
rm indices.tmp
rm indice.tmp