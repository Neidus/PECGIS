<!DOCTYPE HTML>

<html>
	<head>
		<title>Inicio</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="diseño/assets/css/main.css" />
                <%@include file="./header.jsp"%>
	</head>
	<body>
            
            
		<!-- Home -->
                    <div class="wrapper style1 first">
                    <article class="container" id="top">
					<div class="row">
						<div class="4u 12u(mobile)">
							<span class="image fit"><img src="diseño/images/perfil.png" alt="" /></span>
						</div>
						<div class="8u 12u(mobile)">
							<header>
								<h1>Bienvenido <strong><%= session.getAttribute("usuario") %></strong>.</h1>
							</header>
							<p>Establezca su recorrido.</p>
							<!--<a href="#work" class="button big scrolly">Learn about what I do</a>-->
						</div>
					</div>
				</article>
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