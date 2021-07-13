select provincia_codigo, provincia_nombre, comunidad_autonoma, comarca, municipio
from STG_Evitar_Aglomeracion

RIGHT JOIN STG_Llamadas112
ON STG_Evitar_Aglomeracion.provincia = STG_Llamadas112.provincia

FULL OUTER JOIN STG_Poblacion
ON STG_Evitar_Aglomeracion.provincia = STG_Poblacion.provincia_nombre

group by STG_Evitar_Aglomeracion.provincia, comunidad_autonoma, provincia_codigo, provincia_nombre, comarca, municipio

order by comunidad_autonoma


