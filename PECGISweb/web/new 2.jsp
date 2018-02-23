<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- llamamos a la libreria leaflet --> 
<script src="https://unpkg.com/leaflet@1.3.1/dist/leaflet.js"></script>
<!-- llamamos a la hoja de estilos css de leaflet --> 
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.3.1/dist/leaflet.css" />
<!-- aspectos del tamaño del mapa que se pueden modificar --> 
<style>
	#map { 
		width: 100%;
		height: 580px;
		box-shadow: 5px 5px 5px #888;
	}
</style>
</head>
	<body>
		<div style="text-align: center;">
			<button onclick="obtener_localizacion()">Localizate</button>         
		</div>
		<br>
		<div id = 'map'>
		</div>
		<script language="JavaScript1.2">
                 
		function obtener_localizacion() {
			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(mostrar_posicion);
   
			} 
			else{
					alert("No se pudo geolocalizar")
				}
		}
		function mostrar_posicion (position) {  
                  
		// L.map es la clase centrar que crea y manipula el mapa
			var map = L.map('map'). // hacemos una llamada al div 
			// selecionamos una serie de coordenadas y un nivel de zoom 
			setView([position.coords.latitude, position.coords.longitude],15);
			//L.titleLayer añade un mapa base en este caso de openstreetmap, L.titleLayer viene con unos atributos y el tamaño maximo de la capa
			L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', { 
				attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>', maxZoom: 18
			}).addTo(map);
			// control de escala
			L.control.scale().addTo(map);
			// icono que se puede mover 
			L.marker([position.coords.latitude, position.coords.longitude],{draggable: true}).addTo(map);
                         
                        
		}
                
              

		</script>

               
                
	</body>
</html>