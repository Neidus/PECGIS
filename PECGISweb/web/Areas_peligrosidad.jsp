<%-- 
    Document   : Areas
    Created on : 24-feb-2018, 10:48:53
    Author     : Sagrek28-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html> 
    <head> 
        <title>Areas_de_Peligrosidad</title>

 <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="shortcut icon" type="image/x-icon" href="docs/images/favicon.ico" />

    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.3.1/dist/leaflet.css" integrity="sha512-Rksm5RenBEKSKFjgI3a41vrjkw4EVPlJ3+OiI65vTjIdo9brlAacEuKOiQ5OFh7cOI1bkDwLqdLw3Zg0cRJAAQ==" crossorigin=""/>

    <script src="https://unpkg.com/leaflet@1.3.1/dist/leaflet.js" integrity="sha512-/Nsx9X4HebavoBvEBuyp3I7od5tA0UzAxs+j83KgC8PU0kgB4XiK4Lfe4y4cgBtaRJQEIFCW+oC506aPT2L1zw==" crossorigin=""></script>


    <!-- Utilizamos una libreria que es leafleat.draw, para que tiene asociado un plugin, para dibujar en el mapa nuestra areas, que son poligonos.-->

      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/leaflet.draw/0.2.3/leaflet.draw.css" />   
    <script src="https://cdnjs.cloudflare.com/ajax/libs/leaflet.draw/0.2.3/leaflet.draw.js"></script>
   

    </head>    
    <body> 
        <div>Areas_de_Peligrosidad</div>

        <!--  **** Parte adri: Utilizano leafleat.draw, para dibujar areas con leaflet -->

        <div id="map" style="width: 1000px; height: 1000px;"></div> <!-- Dentro de esta sección establecemos el mapa -->


<script>

 // center of the map
var center = [57.74, 11.94];


var map = L.map('map').setView(center, 13); //Creamos el mapa, y establecemos el centro.

//Creamos el layer.
L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
        maxZoom: 18,
        attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, ' +
            '<a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
            'Imagery © <a href="http://mapbox.com">Mapbox</a>',
        id: 'mapbox.streets'
    }).addTo(map);   // Establecemos el titulo,  hacemos referencia a al mapa openstret map. Y lo metemos como atributto a la varible de leaftel --> L.map que y se establece en el Div.

// Creamos nuestro grupo de caracteristicas, y las metemos en un layer.
var editableLayers = new L.FeatureGroup();
map.addLayer(editableLayers);

//Implementamos el plugin.

var drawPluginOptions = {
  position: 'topright',
  draw: {
    polygon: { //Clase polygon, 
      allowIntersection: false, 
      drawError: {
        color: '#7c0204', //Establecemos un color rojo para que resalte que es un error.
        message: '<strong>Oh vaya!<strong> no puedes dibujar eso' // Message that will show when intersect
      },
      shapeOptions: {
        color: '#97009c' //Color por defecto para crearlo.
      }
    },
   
    polyline: false,
    circle: false, //Desabilitamos los demás elementos.
    rectangle: false,
    marker: false,
    },
  edit: {
    featureGroup: editableLayers, //Requierido, para meterlos en el array, para mandar los objetos En GeoJSON.
    remove: false //Opción para borrar los objetos, desabiliada.
  }
};


// Añadimos el pluguín a un Control, para dibujar las Areas.
var drawControl = new L.Control.Draw(drawPluginOptions);
map.addControl(drawControl);

var editableLayers = new L.FeatureGroup();  //Mi array de objetos Layers, para poeder pasar en formato JSON a la plarte de allicación de java.
map.addLayer(editableLayers);

map.on('draw:created', function(e) {  
  var type = e.layerType,
    layer = e.layer;

   function getRandomColor_in() {  //Función que genera aleatoriamente un color en código Hexadecimal de 6, que representa un color en html. 
  var letters = '0123456789ABCDEF';
  var color = '#';
  for (var i = 0; i < 6; i++) {
    color += letters[Math.floor(Math.random() * 16)]; //Vamos concatenando y generando números  hexadecimales.
  }
  return color;
}

function createButton(label, container) {   
    
    var btn = L.DomUtil.create('button', '', container);  //Creamos el objeto, y lo metemos en el contededor.
    
    btn.setAttribute('type', 'button');  //El objeto va a ser un boton.
    
    btn.innerHTML = label;  //Establecemos el texto.
    
    return btn; //Nos devuelve el objeto botón.
}


function createInput(label, container) {   
    
    var area = L.DomUtil.create('input', '', container);  //Creamos el objeto, y lo metemos en el contededor.
    
    area.setAttribute('type', 'input');  //El objeto va a ser un area.
    
    area.innerHTML = label;  //Establecemos el texto.
    
      return area;
  }

   if (type === 'polygon') {
    layer.setStyle({'color': getRandomColor_in() }); //Cuando el layer, del evento, sea un poligono (Area) cambiamos dentro de su estilo, el atributo color, y establecemos el color generado.
  }

  editableLayers.addLayer(layer); //Y lo establecemos dentro de nuestro array de layers.
  

    var container = L.DomUtil.create('div'),  //Nos creamos un contenedor, (div en html).
        
      area_texto = createInput('Escribe la peligrosidad (0 - 5)', container),   
        
      boton = createButton('Cargar peligrosidad del Area', container);
     
      L.popup()
        
        .setContent(container)  //Cambiamos el contedor, al crado, para poner en el pop up, el contedor con los boton y el area, para meter la peligrosidad..

        .setLatLng(layer.getCenter())  //Lo mostramos en el centro del mapa.
        
        .openOn(map); 
        
        
        L.DomEvent.on(boton, 'click', function() {  //Cuando hacemos click al boton cogemos los datos.
        
        if (document.getElementById("zonas").value === "") {
            document.getElementById("zonas").value =  JSON.stringify(layer.getLatLngs());  
            
        } else {
            document.getElementById("zonas").value = document.getElementById("zonas").value +"," + JSON.stringify(layer.getLatLngs());  
        }
          

        if (document.getElementById("peligrosidades").value === "") {
            document.getElementById("peligrosidades").value = area_texto.value;
        } else {
            document.getElementById("peligrosidades").value = document.getElementById("peligrosidades").value +"," + area_texto.value;
        }
          
          alert(document.getElementById("zonas").value);  //Establecemos el conjunto de puntos a un input de un formulario.
          //alert(document.getElementById("peligrosidades").value); 

        map.closePopup(); //Y cerramos el popup. 
    });


 
   
});

</script>

 
    
<form action="/PECGISweb/InsertarZona" method="POST">
 
    <!-- guardara el json de las coordenadas de las zonas -->
    <input name= "zonas" id="zonas" type="hidden" >
    <!-- guardara los niveles de peligrosidad introducidos para cada zona -->
    <input name= "peligrosidades" id="peligrosidades" type="hidden" >
    <button>Insertar las zonas</button>
</form>
    </body>
</html>
