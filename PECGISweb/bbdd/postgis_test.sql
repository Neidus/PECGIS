﻿SELECT AddGeometryColumn('points_table','geom',4326,'POINT',2);

INSERT INTO points_table (geom,attribute) VALUES
(ST_PointFromText('POINT(-10 5)',4326),'Pt1');

INSERT INTO points_table (geom,attribute) VALUES
(ST_PointFromText('POINT(5 5)',4326),'Pt2');
INSERT INTO points_table (geom,attribute) VALUES
(ST_PointFromText('POINT(-20 20)',4326),'Pt3');

SELECT * FROM geometry_columns


CREATE TABLE polygons_table (
gid serial PRIMARY KEY,
attribute char(3)
);

SELECT AddGeometryColumn('lines_table','geom',4326,'LINESTRING',2);
SELECT AddGeometryColumn('polygons_table','geom',4326,'POLYGON',2);


INSERT INTO lines_table (geom,attribute) VALUES
(ST_GeomFromText('LINESTRING(-10 5, 5 5)',4326),'Li1');

INSERT INTO lines_table (geom,attribute) VALUES
(ST_GeomFromText('LINESTRING(-10 -20, 10 -20, 20 25, 40 10, 40 -5)',4326),'Li2');

INSERT INTO polygons_table (geom,attribute) VALUES
(ST_GeometryFromText('POLYGON((-20 10, 10 10, 10 -20, -20 10))',4326),'Po1');

INSERT INTO polygons_table (geom,attribute) VALUES
(ST_GeometryFromText('POLYGON((0 0, 0 30, 30 0, 0 0))',4326),'Po2');


'POLYGON((-20 10, 10 10, 10 -20, -20 10))' 'Po1'


SELECT ST_AsText(ST_GeomFromGeoJSON('{"type":"LineString","coordinates":[[1,2,3],[4,5,6],[7,8,9]]}')) As wkt;


INSERT INTO lines_table (geom,attribute) VALUES (

INSERT INTO lines_table (geom,attribute) VALUES
(ST_GeomFromText(wkt,4326),'Li1');


// inserts y updates

SELECT * FROM RUTAS;


UPDATE rutas
SET 
    geom = ST_SetSRID(ST_GeomFromGeoJSON
    ('{
            "type" : "LineString",
            "coordinates" : [[1,2],[4,6],[7,9]]
    }'), 4326)  
WHERE gid_serial = 1;

INSERT INTO rutas (gid_serial, nombre, usuario, geom) VALUES (1,'ruta1', 'fernando',
ST_SetSRID(ST_GeomFromGeoJSON('{"type":"LineString","coordinates":[[1,2],[4,5],[7,8]]}'),4326));

INSERT INTO rutas (nombre, usuario, geom) VALUES ('ruta1', 'fernando',
ST_SetSRID(ST_GeomFromGeoJSON('{"type":"LineString","coordinates":[[1,3],[4,12],[35,8]]}'),4326));


INSERT INTO zonas (nombre, peligrosidad, geom) VALUES ('zona7', 3,ST_SetSRID(ST_GeomFromGeoJSON(
'{"type":"Polygon",
"coordinates":[[[-4.56,-7.3],[-4.09,126.12],[135.34,-18.67],[-4.56,-7.3]]]
}'),4326));


UPDATE zonas
SET 
    geom = ST_SetSRID(ST_GeomFromGeoJSON
    ('{
            "type" : "Polygon",
            "coordinates" :[[[-4,-7],[-4,126],[135,-18],[-4,-7]]]
                }'), 4326)  
WHERE gid_serial = 3;

//pruebas BBDD

INSERT INTO rutas (nombre, usuario, geom) VALUES ('ruta1', 'fernando',
ST_SetSRID(ST_GeomFromGeoJSON('{"type":"LineString","coordinates":[[57.67921,11.94897],[57.6789,11.75],[57.75,11.63]]}'),4326));



INSERT INTO rutas (nombre, usuario, geom) VALUES ('ruta5', 'fernando',
ST_SetSRID(ST_GeomFromGeoJSON('{"type":"LineString","coordinates":[[57.73998,11.94006],[57.74,11.94011],[57.74001,11.9402],[57.74002,11.94038],[57.74004,11.9405],[57.74004,11.9405],
[57.74102,11.94015],[57.74128,11.94003],[57.74142,11.93996],[57.74145,11.93995],[57.74145,11.93995],[57.74143,11.94007],[57.74144,11.94025],[57.74144,11.94025],[57.7414,11.94029],
[57.74137,11.94035],[57.74137,11.94035],[57.74129,11.94041],[57.74115,11.94046],[57.7409,11.94055],[57.74011,11.94088],[57.73959,11.94109],[57.73908,11.94128],[57.73844,11.9415],
[57.73836,11.94153],[57.73801,11.94165],[57.7379,11.94169],[57.7375,11.94181],[57.73702,11.94194],[57.73658,11.94197],[57.73617,11.94195],[57.73567,11.94192],[57.73524,11.9419],
[57.73463,11.94181],[57.7345,11.9418],[57.73435,11.94179],[57.73431,11.94177],[57.73431,11.94177],[57.73428,11.94174],[57.73424,11.94173],[57.73419,11.94177],[57.73415,11.94183],
[57.73415,11.94183],[57.734,11.94183],[57.73373,11.9419],[57.73349,11.94197],[57.73321,11.94207],[57.73293,11.94227],[57.73289,11.94228],[57.73267,11.94237],[57.73256,11.94236],
[57.73242,11.94239],[57.73228,11.94247],[57.73223,11.9425],[57.7322,11.94252],[57.73211,11.94254],[57.73204,11.94254],[57.73204,11.94254],[57.73199,11.94249],[57.73193,11.94248],
[57.73187,11.94252],[57.73184,11.94258],[57.73183,11.94264],[57.73182,11.94272],[57.73182,11.94272],[57.73176,11.94284],[57.73149,11.94318],[57.73108,11.94355],[57.73071,11.94387]]}'),4326));





INSERT INTO rutas (nombre, usuario, geom) VALUES ('3km', 'fernando',
ST_SetSRID(ST_GeomFromGeoJSON('{"type":"LineString","coordinates":
[[57.73998,11.94006],[57.74,11.94011],[57.74001,11.9402],[57.74002,11.94038],[57.74004,11.9405],
[57.74004,11.9405],[57.74102,11.94015],[57.74128,11.94003],[57.74142,11.93996],[57.74145,11.93995],
[57.74145,11.93995],[57.74143,11.94007],[57.74144,11.94025],[57.74144,11.94025],[57.7414,11.94029],
[57.74137,11.94035],[57.74137,11.94035],[57.74129,11.94041],[57.74115,11.94046],[57.7409,11.94055],
[57.74011,11.94088],[57.73959,11.94109],[57.73908,11.94128],[57.73844,11.9415],[57.73836,11.94153],
[57.73801,11.94165],[57.7379,11.94169],[57.7375,11.94181],[57.73702,11.94194],[57.73658,11.94197],
[57.73617,11.94195],[57.73567,11.94192],[57.73524,11.9419],[57.73463,11.94181],[57.7345,11.9418],
[57.73435,11.94179],[57.73431,11.94177],[57.73431,11.94177],[57.73428,11.94174],[57.73424,11.94173],
[57.73419,11.94177],[57.73415,11.94183],[57.73415,11.94183],[57.734,11.94183],[57.73373,11.9419],
[57.73349,11.94197],[57.73321,11.94207],[57.73293,11.94227],[57.73289,11.94228],[57.73267,11.94237],
[57.73256,11.94236],[57.73242,11.94239],[57.73228,11.94247],[57.73223,11.9425],[57.7322,11.94252],
[57.73211,11.94254],[57.73204,11.94254],[57.73204,11.94254],[57.73199,11.94249],[57.73193,11.94248],
[57.73187,11.94252],[57.73184,11.94258],[57.73183,11.94264],[57.73182,11.94272],[57.73182,11.94272],
[57.73176,11.94284],[57.73149,11.94318],[57.73108,11.94355],[57.73071,11.94387],[57.7304,11.94405],
[57.73024,11.94415],[57.73001,11.94425],[57.73001,11.94425],[57.7299,11.94443],[57.7298,11.94472],
[57.72977,11.9449],[57.72976,11.94495],[57.72974,11.94578],[57.72974,11.94594],[57.72974,11.94606],
[57.72974,11.94611],[57.72976,11.94687],[57.72973,11.94764],[57.72973,11.94788],[57.72959,11.94886],
[57.72954,11.94906],[57.72954,11.94906],[57.72949,11.94908],[57.72946,11.94912],[57.72942,11.94923],
[57.72941,11.94932],[57.72942,11.9494],[57.72946,11.94951],[57.72946,11.94951],[57.7295,11.94981],
[57.72954,11.95026],[57.72958,11.95135],[57.72963,11.95196],[57.72966,11.95244],[57.72974,11.95353],
[57.72973,11.95387],[57.72971,11.9541],[57.72968,11.95426],[57.72968,11.95426],[57.72965,11.95435],
[57.72965,11.95435],[57.7295,11.95447],[57.72931,11.95463],[57.72925,11.95472],[57.72918,11.95487],
[57.72896,11.95533],[57.72882,11.95558],[57.72793,11.95727],[57.72778,11.95759],[57.72769,11.95784],
[57.72766,11.95793],[57.72763,11.95799],[57.7273,11.95913],[57.72719,11.9595],[57.72709,11.95987],
[57.72703,11.96007],[57.72697,11.96029],[57.72694,11.96039],[57.72693,11.96041],[57.72691,11.96063],
[57.72691,11.96063],[57.72687,11.96067],[57.72685,11.96073],[57.72683,11.96081],[57.72683,11.96081],
[57.7266,11.96057],[57.72474,11.95876],[57.72474,11.95876],[57.72476,11.95869],[57.72476,11.95862],
[57.72475,11.95856],[57.72473,11.9585],[57.72469,11.95844],[57.72465,11.95843],[57.7246,11.95844],
[57.72457,11.95849],[57.72454,11.95854],[57.72453,11.95865],[57.72454,11.95874]]}'),4326));








,[57.72454,11.95874],[57.7245,11.95896],[57.72453,11.95865],[57.72454,11.95874],[57.72454,11.95874],
[57.7245,11.95896],[57.72444,11.95909],[57.72438,11.95921],[57.72438,11.95921],[57.72428,11.95931],
[57.72418,11.95944],[57.72411,11.95949],[57.72404,11.95951],[57.72395,11.95949],[57.72376,11.9593],
[57.72348,11.95899],[57.72328,11.95873],[57.72301,11.95833],[57.72284,11.95805],[57.72269,11.95786],
[57.72258,11.95775],[57.72239,11.95756],[57.72239,11.95756],[57.72049,11.95556],[57.71988,11.95495],
[57.71932,11.95439],[57.71874,11.95376],[57.71858,11.95354],[57.71835,11.95324],[57.71829,11.95314],
[57.71777,11.95226],[57.717,11.95088],[57.71628,11.9496],[57.71528,11.94783],[57.71466,11.94673],
[57.71435,11.94616],[57.71408,11.94565],[57.71383,11.94512],[57.71361,11.94464],[57.71334,11.944],
[57.71313,11.94348],[57.71292,11.94294],[57.71278,11.94255],[57.71269,11.94227],[57.71259,11.94192],
[57.7125,11.94146],[57.71243,11.94105],[57.71238,11.94062],[57.71235,11.94015],[57.71232,11.93968],
[57.71218,11.93708],[57.71209,11.93554],[57.71196,11.93303],[57.71191,11.93186],[57.7119,11.93142],
[57.71186,11.93103],[57.71183,11.93083],[57.71178,11.93053],[57.71168,11.93012],[57.71157,11.92972],
[57.71143,11.92936],[57.71128,11.929],[57.71097,11.92827],[57.71088,11.92803],[57.71073,11.92752],
[57.71047,11.92655],[57.7104,11.92621],[57.71035,11.92591],[57.71032,11.92565],[57.7103,11.9254],
[57.71029,11.92515],[57.71029,11.92468],[57.71032,11.92413],[57.71044,11.92331],[57.71061,11.92258],
[57.71061,11.92258],[57.71109,11.92066],[57.71213,11.9178],[57.71276,11.91525],[57.71282,11.9139],
[57.71289,11.91248],[57.71236,11.90572],[57.71155,11.90038],[57.71084,11.89744],[57.70991,11.8951],
[57.70868,11.89255],[57.7084,11.89201],[57.70828,11.89178],[57.70811,11.89155],[57.70785,11.89132],
[57.70751,11.89104],[57.70751,11.89104],[57.70729,11.89091],[57.70709,11.89074],[57.70666,11.8904],
[57.70631,11.89012],[57.70618,11.89003],[57.70605,11.88995],[57.70593,11.88991],[57.70581,11.88987],
[57.70572,11.88987],[57.70559,11.88988],[57.70545,11.88991],[57.70533,11.88996],[57.70523,11.89003],
[57.70511,11.89012],[57.70499,11.89025],[57.7049,11.89038],[57.70476,11.89058],[57.70468,11.89074],
[57.70463,11.89084],[57.70459,11.89096],[57.70454,11.8911],[57.7045,11.89127],[57.70446,11.8914],
[57.70443,11.8915],[57.70438,11.89161],[57.70433,11.8917],[57.70424,11.89181],[57.70418,11.89187],
[57.70385,11.89214],[57.70375,11.89219],[57.70323,11.89256],[57.70275,11.89288],[57.70204,11.89341],
[57.7013,11.89388],[57.70066,11.89433],[57.70066,11.89433],[57.70034,11.89454],[57.69992,11.89481],
[57.69949,11.89518],[57.69908,11.89556],[57.69832,11.89617],[57.69803,11.89641],[57.69773,11.89666],
[57.69747,11.89688],[57.69721,11.8971],[57.69668,11.89757],[57.69635,11.89784],[57.69601,11.8981],
[57.69562,11.89843],[57.69511,11.89882],[57.69496,11.89893],[57.69481,11.89905],[57.69466,11.89917],
[57.69466,11.89917],[57.68722,11.90381],[57.68671,11.90406],[57.68644,11.90417],[57.68623,11.9042],
[57.68604,11.90422],[57.68563,11.9042],[57.68524,11.90414],[57.68488,11.90406],[57.68446,11.90398],
[57.68419,11.90395],[57.68419,11.90395],[57.68399,11.90392],[57.68347,11.90392],[57.68303,11.90403],
[57.68247,11.90413],[57.6823,11.90409],[57.68217,11.90409],[57.68204,11.90407],[57.68188,11.904],
[57.68169,11.90387],[57.68143,11.90362],[57.68124,11.90346],[57.68124,11.90346],[57.68103,11.90339],
[57.68094,11.90338],[57.68087,11.90339],[57.68081,11.90341],[57.68074,11.90344],[57.68068,11.90348],
[57.68063,11.90353],[57.68055,11.90361],[57.68055,11.90361],[57.6805,11.90368],[57.68046,11.90375],
[57.68042,11.90383],[57.68038,11.90393],[57.68034,11.90404],[57.68031,11.90415],[57.68028,11.90427],
[57.68023,11.90448],[57.68018,11.90481],[57.68013,11.90517],[57.68006,11.90608],[57.68001,11.90714],
[57.68002,11.90776],[57.68002,11.90859],[57.68,11.9094],[57.67996,11.90984],[57.67989,11.91032],
[57.67979,11.91077],[57.67964,11.91122],[57.67948,11.91155],[57.67932,11.91183],[57.67912,11.91207],
[57.67896,11.91222],[57.67879,11.91234],[57.6784,11.91256],[57.67808,11.91275],[57.67784,11.91292],
[57.67759,11.91317],[57.67746,11.91336],[57.67733,11.91359],[57.67692,11.91445],[57.67646,11.91551],
[57.67615,11.91621],[57.67588,11.91694],[57.67538,11.91834],[57.67522,11.91887],[57.67516,11.91909],
[57.67507,11.91949],[57.67487,11.92045],[57.67474,11.92133],[57.6747,11.9218],[57.67468,11.92227],
[57.67468,11.92285],[57.6747,11.92328],[57.67473,11.92369],[57.67477,11.92398],[57.67488,11.92452],
[57.67499,11.925],[57.67547,11.92697],[57.67596,11.92901],[57.67607,11.92945],[57.6762,11.93007],
[57.67646,11.93139],[57.6767,11.93251],[57.67678,11.93289],[57.67684,11.9334],[57.67687,11.93354],
[57.67689,11.93364],[57.67689,11.93364],[57.67688,11.93371],[57.67689,11.93376],[57.67691,11.93383],
[57.67692,11.93386],[57.67693,11.93388],[57.67696,11.93391],[57.67698,11.93392],[57.67702,11.93393],
[57.67702,11.93393],[57.67711,11.93401],[57.67721,11.93413],[57.67731,11.93419],[57.67735,11.93421],
[57.67742,11.93426],[57.67751,11.93432],[57.67761,11.9344],[57.6777,11.93446],[57.67781,11.93454],
[57.67795,11.93464],[57.67807,11.93473],[57.67822,11.93483],[57.67841,11.93497],[57.67862,11.93513],
[57.6788,11.93525],[57.67897,11.9537],[57.73998,11.94006],[57.74,11.94011],[57.74001,11.9402],
[57.74002,11.94038],[57.74004,11.9405],[57.74004,11.9405],[57.74102,11.94015],[57.74128,11.94003],
[57.74142,11.93996],[57.74145,11.93995],[57.74145,11.93995],[57.74143,11.94007],[57.74144,11.94025],
[57.74144,11.94025],[57.7414,11.94029],[57.74137,11.94035],[57.74137,11.94035],[57.74129,11.94041],
[57.74115,11.94046],[57.7409,11.94055],[57.74011,11.94088],[57.73959,11.94109],[57.73908,11.94128],
[57.73844,11.9415],[57.73836,11.94153],[57.73801,11.94165],[57.7379,11.94169],[57.7375,11.94181],
[57.73702,11.94194],[57.73658,11.94197],[57.73617,11.94195],[57.73567,11.94192],[57.73524,11.9419],
[57.73463,11.94181],[57.7345,11.9418],[57.73435,11.94179],[57.73431,11.94177],[57.73431,11.94177],
[57.73428,11.94174],[57.73424,11.94173],[57.73419,11.94177],[57.73415,11.94183],[57.73415,11.94183],
[57.734,11.94183],[57.73373,11.9419],[57.73349,11.94197],[57.73321,11.94207],[57.73293,11.94227],
[57.73289,11.94228],[57.73267,11.94237],[57.73256,11.94236],[57.73242,11.94239],[57.73228,11.94247],
[57.73223,11.9425],[57.7322,11.94252],[57.73211,11.94254],[57.73204,11.94254],[57.73204,11.94254],
[57.73199,11.94249],[57.73193,11.94248],[57.73187,11.94252],[57.73184,11.94258],[57.73183,11.94264],
[57.73182,11.94272],[57.73182,11.94272],[57.73176,11.94284],[57.73149,11.94318],[57.73108,11.94355],
[57.73071,11.94387],[57.7304,11.94405],[57.73024,11.94415],[57.73001,11.94425],[57.73001,11.94425],
[57.7299,11.94443],[57.7298,11.94472],[57.72977,11.9449],[57.72976,11.94495],[57.72974,11.94578],
[57.72974,11.94594],[57.72974,11.94606],[57.72974,11.94611],[57.72976,11.94687],[57.72973,11.94764],
[57.72973,11.94788],[57.72959,11.94886],[57.72954,11.94906],[57.72954,11.94906],[57.72949,11.94908],
[57.72946,11.94912],[57.72942,11.94923],[57.72941,11.94932],[57.72942,11.9494],[57.72946,11.94951],
[57.72946,11.94951],[57.7295,11.94981],[57.72954,11.95026],[57.72958,11.95135],[57.72963,11.95196],
[57.72966,11.95244],[57.72974,11.95353],[57.72973,11.95387],[57.72971,11.9541],[57.72968,11.95426],
[57.72968,11.95426],[57.72965,11.95435],[57.72965,11.95435],[57.7295,11.95447],[57.72931,11.95463],
[57.72925,11.95472],[57.72918,11.95487],[57.72896,11.95533],[57.72882,11.95558],[57.72793,11.95727],
[57.72778,11.95759],[57.72769,11.95784],[57.72766,11.95793],[57.72763,11.95799],[57.7273,11.95913],
[57.72719,11.9595],[57.72709,11.95987],[57.72703,11.96007],[57.72697,11.96029],[57.72694,11.96039],
[57.72693,11.96041],[57.72691,11.96063],[57.72691,11.96063],[57.72687,11.96067],[57.72685,11.96073],
[57.72683,11.96081],[57.72683,11.96081],[57.7266,11.96057],[57.72474,11.95876],[57.72474,11.95876],
[57.72476,11.95869],[57.72476,11.95862],[57.72475,11.95856],[57.72473,11.9585],[57.72469,11.95844],
[57.72465,11.95843],[57.7246,11.95844],[57.72457,11.95849],[57.72454,11.95854],[57.72453,11.95865],
[57.72454,11.95874],[57.72454,11.95874],[57.7245,11.95896],[57.72444,11.95909],[57.72438,11.95921],
[57.72438,11.95921],[57.72428,11.95931],[57.72418,11.95944],[57.72411,11.95949],[57.72404,11.95951],
[57.72395,11.95949],[57.72376,11.9593],[57.72348,11.95899],[57.72328,11.95873],[57.72301,11.95833],
[57.72284,11.95805],[57.72269,11.95786],[57.72258,11.95775],[57.72239,11.95756],[57.72239,11.95756],
[57.72049,11.95556],[57.71988,11.95495],[57.71932,11.95439],[57.71874,11.95376],[57.71858,11.95354],
[57.71835,11.95324],[57.71829,11.95314],[57.71777,11.95226],[57.717,11.95088],[57.71628,11.9496],
[57.71528,11.94783],[57.71466,11.94673],[57.71435,11.94616],[57.71408,11.94565],[57.71383,11.94512],
[57.71361,11.94464],[57.71334,11.944],[57.71313,11.94348],[57.71292,11.94294],[57.71278,11.94255],
[57.71269,11.94227],[57.71259,11.94192],[57.7125,11.94146],[57.71243,11.94105],[57.71238,11.94062],
[57.71235,11.94015],[57.71232,11.93968],[57.71218,11.93708],[57.71209,11.93554],[57.71196,11.93303],
[57.71191,11.93186],[57.7119,11.93142],[57.71186,11.93103],[57.71183,11.93083],[57.71178,11.93053],
[57.71168,11.93012],[57.71157,11.92972],[57.71143,11.92936],[57.71128,11.929],[57.71097,11.92827],
[57.71088,11.92803],[57.71073,11.92752],[57.71047,11.92655],[57.7104,11.92621],[57.71035,11.92591],
[57.71032,11.92565],[57.7103,11.9254],[57.71029,11.92515],[57.71029,11.92468],[57.71032,11.92413],
[57.71044,11.92331],[57.71061,11.92258],[57.71061,11.92258],[57.71109,11.92066],[57.71213,11.9178],
[57.71276,11.91525],[57.71282,11.9139],[57.71289,11.91248],[57.71236,11.90572],[57.71155,11.90038],
[57.71084,11.89744],[57.70991,11.8951],[57.70868,11.89255],[57.7084,11.89201],[57.70828,11.89178],
[57.70811,11.89155],[57.70785,11.89132],[57.70751,11.89104],[57.70751,11.89104],[57.70729,11.89091],
[57.70709,11.89074],[57.70666,11.8904],[57.70631,11.89012],[57.70618,11.89003],[57.70605,11.88995],
[57.70593,11.88991],[57.70581,11.88987],[57.70572,11.88987],[57.70559,11.88988],[57.70545,11.88991],
[57.70533,11.88996],[57.70523,11.89003],[57.70511,11.89012],[57.70499,11.89025],[57.7049,11.89038],
[57.70476,11.89058],[57.70468,11.89074],[57.70463,11.89084],[57.70459,11.89096],[57.70454,11.8911],
[57.7045,11.89127],[57.70446,11.8914],[57.70443,11.8915],[57.70438,11.89161],[57.70433,11.8917],
[57.70424,11.89181],[57.70418,11.89187],[57.70385,11.89214],[57.70375,11.89219],[57.70323,11.89256],
[57.70275,11.89288],[57.70204,11.89341],[57.7013,11.89388],[57.70066,11.89433],[57.70066,11.89433],
[57.70034,11.89454],[57.69992,11.89481],[57.69949,11.89518],[57.69908,11.89556],[57.69832,11.89617],
[57.69803,11.89641],[57.69773,11.89666],[57.69747,11.89688],[57.69721,11.8971],[57.69668,11.89757],
[57.69635,11.89784],[57.69601,11.8981],[57.69562,11.89843],[57.69511,11.89882],[57.69496,11.89893],
[57.69481,11.89905],[57.69466,11.89917],[57.69466,11.89917],[57.68722,11.90381],[57.68671,11.90406],
[57.68644,11.90417],[57.68623,11.9042],[57.68604,11.90422],[57.68563,11.9042],[57.68524,11.90414],
[57.68488,11.90406],[57.68446,11.90398],[57.68419,11.90395],[57.68419,11.90395],[57.68399,11.90392],
[57.68347,11.90392],[57.68303,11.90403],[57.68247,11.90413],[57.6823,11.90409],[57.68217,11.90409],
[57.68204,11.90407],[57.68188,11.904],[57.68169,11.90387],[57.68143,11.90362],[57.68124,11.90346],
[57.68124,11.90346],[57.68103,11.90339],[57.68094,11.90338],[57.68087,11.90339],[57.68081,11.90341],
[57.68074,11.90344],[57.68068,11.90348],[57.68063,11.90353],[57.68055,11.90361],[57.68055,11.90361],
[57.6805,11.90368],[57.68046,11.90375],[57.68042,11.90383],[57.68038,11.90393],[57.68034,11.90404],
[57.68031,11.90415],[57.68028,11.90427],[57.68023,11.90448],[57.68018,11.90481],[57.68013,11.90517],
[57.68006,11.90608],[57.68001,11.90714],[57.68002,11.90776],[57.68002,11.90859],[57.68,11.9094],
[57.67996,11.90984],[57.67989,11.91032],[57.67979,11.91077],[57.67964,11.91122],[57.67948,11.91155],
[57.67932,11.91183],[57.67912,11.91207],[57.67896,11.91222],[57.67879,11.91234],[57.6784,11.91256],
[57.67808,11.91275],[57.67784,11.91292],[57.67759,11.91317],[57.67746,11.91336],[57.67733,11.91359],
[57.67692,11.91445],[57.67646,11.91551],[57.67615,11.91621],[57.67588,11.91694],[57.67538,11.91834],
[57.67522,11.91887],[57.67516,11.91909],[57.67507,11.91949],[57.67487,11.92045],[57.67474,11.92133],
[57.6747,11.9218],[57.67468,11.92227],[57.67468,11.92285],[57.6747,11.92328],[57.67473,11.92369],
[57.67477,11.92398],[57.67488,11.92452],[57.67499,11.925],[57.67547,11.92697],[57.67596,11.92901],
[57.67607,11.92945],[57.6762,11.93007],[57.67646,11.93139],[57.6767,11.93251],[57.67678,11.93289],
[57.67684,11.9334],[57.67687,11.93354],[57.67689,11.93364],[57.67689,11.93364],[57.67688,11.93371],
[57.67689,11.93376],[57.67691,11.93383],[57.67692,11.93386],[57.67693,11.93388],[57.67696,11.93391],
[57.67698,11.93392],[57.67702,11.93393],[57.67702,11.93393],[57.67711,11.93401],[57.67721,11.93413],
[57.67731,11.93419],[57.67735,11.93421],[57.67742,11.93426],[57.67751,11.93432],[57.67761,11.9344],
[57.6777,11.93446],[57.67781,11.93454],[57.67795,11.93464],[57.67807,11.93473],[57.67822,11.93483],
[57.67841,11.93497],[57.67862,11.93513],[57.6788,11.93525],[57.67897,11.93537],[57.67916,11.93551],
[57.67926,11.93558],[57.67934,11.93564],[57.67939,11.93568],[57.67948,11.93575],[57.67948,11.93575],
[57.6795,11.93584],[57.6795,11.93584],[57.67952,11.93603],[57.67954,11.93612],[57.67955,11.93621],
[57.67958,11.93649],[57.67963,11.93681],[57.67971,11.93751],[57.67978,11.93813],[57.67985,11.93867],
[57.67993,11.93931],[57.67993,11.93986],[57.67994,11.94005],[57.67994,11.94028],[57.67995,11.94047],
[57.67996,11.9406],[57.67998,11.94075],[57.68,11.94084],[57.68003,11.94093],[57.68005,11.94101],
[57.68008,11.94112],[57.68014,11.94128],[57.68024,11.94144],[57.68043,11.94179],[57.68066,11.94234],
[57.68076,11.94272],[57.68082,11.94315],[57.68082,11.94318],[57.68088,11.9435],[57.68091,11.94388],
[57.68092,11.9441],[57.68094,11.94434],[57.68093,11.94447],[57.68092,11.94461],[57.6809,11.94484],
[57.68086,11.94502],[57.6808,11.94522],[57.68075,11.94536],[57.68072,11.94545],[57.68049,11.94602],
[57.68047,11.94607],[57.68047,11.94607],[57.68043,11.94617],[57.68037,11.94622],[57.68032,11.94626],
[57.68015,11.94669],[57.67994,11.94725],[57.6797,11.94789],[57.67945,11.94857],[57.67945,11.94857],
[57.67939,11.94849],[57.67939,11.94849],[57.67921,11.94897],[57.67921,11.94897]]

