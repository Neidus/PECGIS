<!DOCTYPE HTML>

<html>
    <head>
        <title>Registrar Recorrido</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="dise�o/assets/css/main.css" />
        <%@include file="./header.jsp"%>

        <!-- Me temos el estilo de leafleat. Es decir m�tene,os la libreria de leaflet online -->

        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" type="image/x-icon" href="docs/images/favicon.ico" />
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.3.1/dist/leaflet.css" integrity="sha512-Rksm5RenBEKSKFjgI3a41vrjkw4EVPlJ3+OiI65vTjIdo9brlAacEuKOiQ5OFh7cOI1bkDwLqdLw3Zg0cRJAAQ==" crossorigin=""/>
        <script src="https://unpkg.com/leaflet@1.3.1/dist/leaflet.js" integrity="sha512-/Nsx9X4HebavoBvEBuyp3I7od5tA0UzAxs+j83KgC8PU0kgB4XiK4Lfe4y4cgBtaRJQEIFCW+oC506aPT2L1zw==" crossorigin=""></script>


        <!-- Para el enrutamiento establecemos unas librerias y un estilo css, en las siguentes links y partes de scripts -->

        <!-- con  lafleat-routing-machine -->

        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.2.0/dist/leaflet.css" />
        <link rel="stylesheet" href="https://unpkg.com/leaflet-routing-machine@latest/dist/leaflet-routing-machine.css" />
        <script src="https://unpkg.com/leaflet@1.2.0/dist/leaflet.js"></script>
        <script src="https://unpkg.com/leaflet-routing-machine@latest/dist/leaflet-routing-machine.js"></script>
    </head>        

    <body>

        <!-- Home -->
        <div id="mapid" style="width: 1400px; height: 600px;"></div> <!-- Dentro de esta secci�n establecemos el mapa -->
        <script>

            var mymap = L.map('mapid').setView([40.513149, -3.349462], 5);  // Nos creamos la variable map, para establecer el mapa.

            L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
                maxZoom: 18,
                attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, ' +
                        '<a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
                        'Imagery � <a href="http://mapbox.com">Mapbox</a>',
                id: 'mapbox.streets'
            }).addTo(mymap);   // Establecemos el titulo,  hacemos referencia a al mapa openstret map. Y lo metemos como atributto a la varible de leaftel --> L.map que y se establece en el Div.



//Establecemos en vez de marcas, los objetos L.latLng para que funcione el routing :

//var punto_a = L.latLng(57.74, 11.94);

//var punto_b = L.latLng(57.6792, 11.949);

//Cuando clickeamos el los puntos nos muestra que puntos son, habriendo un popup, encima del objeto latLng.

//Con la funci�n bindpopup, para eltexto y luego para ense�arlo, openPopup.


//punto_a.bindPopup("Punto A.").openPopup();

//punto_b.bindPopup("Punto B").openPopup();


//Nota: Routing.controls, No vale con L.marker sino que los puntos tienen que ser con este objeto --> L.latLng(57.74, 11.94)
            var control = L.Routing.control({
                waypoints: [
                    L.latLng(40.51286, -3.34526),
                    L.latLng(40.29368, -3.79959)
                ]
            }).addTo(mymap);

//Objeto String en javaScript que guarda todo el conjunto de puntos de la ruta.
            var ruta;

//Para ense�ar la routa.
            control.on('routeselected', function (d) {

                var route = d.route;
                ruta = JSON.stringify(route.coordinates);  //Lo pasamos a formato y lo guardamos enun objeto string.

                // parte a�adida por sergio 
                document.form.resultado.value = ruta;
                document.getElementById("miruta").value = ruta;
            });

            //  **************** Funciones, para esteblecer Origen y Destino. ************************************
            //Funcion para crear un boton, con la librer�a de leaflet, DomUtil, es para poner elementos, por ejemplo html.

            function createButton(label, container) {

                var btn = L.DomUtil.create('button', '', container);  //Creamos el objeto, y lo metemos en el contededor.
                btn.setAttribute('type', 'button');  //El objeto va a ser un boton.
                btn.innerHTML = label;  //Establecemos el texto.
                return btn; //Nos devuelve el objeto bot�n.
            }
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
            mymap.on('click', function (e) {   //Cuando hacemos click, se ejecuta esta funci�n. 

                var container = L.DomUtil.create('div'), //Nos creamos un contenedor, (div en html).

                        startBtn = createButton('Establecer como Origen', container),
                        //llamamos a la funcion, de arriba, para crear el bot y establecerlo en el contenedor.
                        destBtn = createButton('Establecer como Meta', container);

                L.popup()
                        .setContent(container)  //Cambiamos el contedor, al crado, para poner en el pop up, el contedor con los botones.
                        .setLatLng(e.latlng)   //cambiamos la posicion, donde se genera el popapa, por la posici�n del click, dentro del mapa.
                        .openOn(mymap);  //y qie se abra en el mapa.

//- - - - - - - - - - - - - - - - - - - - - - - -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

// Con domEvent, controlamos los eventos de Domutil. Se ejecuta est� funci�n, cuando damos a click, al bot�n de salida.

                L.DomEvent.on(startBtn, 'click', function () {
                    control.spliceWaypoints(0, 1, e.latlng);   //Se cambia el primer punto de la ruta (waypoints) por las latidud y 
                    //longitud de el click , con splice.
                    mymap.closePopup(); //Y cerramos el popup.
                });
                
//Con el b�tom de destino, relizamos lo mismo, pero cambiando sustituyendo por la el punto (latitud y longitud) de la routa waypoints.

                L.DomEvent.on(destBtn, 'click', function () {
                    control.spliceWaypoints(control.getWaypoints().length - 1, 1, e.latlng);
                    mymap.closePopup();

                });
//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
            });
//****************************************************************************************************************
        </script>
        <h2> </h2>
        <!--Parte a�adida por sergio-->
        <form name="form">
            <!--<input type="text" value="" name="resultado"> --> 
            <textarea name="resultado" rows="10" cols="40" disabled="true"></textarea>                
        </form>

        <!--Formulario para introducir la ruta -->
        <form action="/PECGISweb/InsertarGeoJSON" method="POST">  
            <h2> </h2>
            <!--Metemos un input oculto para poder devolverle el valor a java cuando guardemos la ruta--> 
            <p>Por favor inserte el nombre de la ruta <strong><input name= "nombre" type="text" class="wrapper style4 form input" id="Nombre" required></strong></p>
            <input name= "rutas" id="miruta" type="hidden" >
            <button id="button" >Introducir Ruta</button>
        </form>
    </div>

    <!-- Scripts -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/jquery.scrolly.min.js"></script>
    <script src="assets/js/skel.min.js"></script>
    <script src="assets/js/skel-viewport.min.js"></script>
    <script src="assets/js/util.js"></script>
    <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
    <script src="assets/js/main.js"></script>

</body>
</html>