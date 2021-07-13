select provincia_codigo, STG_Llamadas112.provincia, comunidad_autonoma, comarca, municipio
from STG_Llamadas112

JOIN STG_Evitar_Aglomeracion
ON STG_Llamadas112.provincia = STG_Evitar_Aglomeracion.provincia

JOIN STG_Poblacion
ON STG_Llamadas112.provincia = STG_Poblacion.provincia_nombre

group by provincia_codigo, STG_Llamadas112.provincia, comunidad_autonoma, comarca, municipio

order by municipio


select provincia_codigo, provincia_nombre, comunidad_autonoma
from STG_Evitar_Aglomeracion

RIGHT JOIN STG_Poblacion
ON STG_Evitar_Aglomeracion.provincia = STG_Poblacion.provincia_nombre

group by provincia_codigo, provincia_nombre, comunidad_autonoma

order by comunidad_autonoma

