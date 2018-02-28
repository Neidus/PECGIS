//insertar rutas y zonas

INSERT INTO rutas (nombre, usuario, geom) VALUES ('ruta1', 'fernando',
ST_SetSRID(ST_GeomFromGeoJSON('{"type":"LineString","coordinates":[[1,3],[4,12],[35,8]]}'),4326));

INSERT INTO zonas (nombre, peligrosidad, geom) VALUES ('zona7', 3,ST_SetSRID(ST_GeomFromGeoJSON('{"type":"Polygon",
"coordinates":[[[-4.56,-7.3],[-4.09,126.12],[135.34,-18.67],[-4.56,-7.3]]]}'),4326));


//actualizar rutas y zonas

UPDATE rutas
SET geom = ST_SetSRID(ST_GeomFromGeoJSON ('{
            "type" : "LineString",
            "coordinates" : [[1,2],[4,6],[7,9]]}'), 4326)  
WHERE gid_serial = 1;


UPDATE zonas
SET geom = ST_SetSRID(ST_GeomFromGeoJSON('{
            "type" : "Polygon",
            "coordinates" :[[[-4,-7],[-4,126],[135,-18],[-4,-7]]]}'), 4326)  
WHERE gid_serial = 3;


//calcular distancia de una ruta

SELECT ST_length(rutas.geom)
from rutas 
where rutas.gid_serial=1;

//ver distancia inytersecciones usuario

SELECT ST_length(intersecciones.geom)
from intersecciones 
where intersecciones.usuario= 'fernando';


//ver todas intersecciones por usuario

SELECT *
from intersecciones 
where intersecciones.usuario= 'fernando';

//inserta en la tabla intersecciones

INSERT INTO intersecciones 
SELECT ST_Intersection(rutas.geom, zonas.geom), peligrosidad, ST_Length(ST_Intersection(rutas.geom, zonas.geom)), usuario
from rutas, zonas 
where rutas.gid_serial=1 and zonas.gid_serial=1;