<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Canchas en linea</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="icon" href="image/logo.jpg" sizes="30x30">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="control.js"></script>
<style>
/* Add a gray background color and some padding to the footer */
footer {
	background-color: #f2f2f2;
	padding: 25px;
}

.carousel-inner img {
	width: 100%; /* Set width to 100% */
	min-height: 200px;
}

/* Hide the carousel text when the screen is less than 600 pixels wide */
@media ( max-width : 600px) {
	.carousel-caption {
		display: none;
	}
}
</style>
</head>
<body>

<%
	HttpSession objSesion = request.getSession(false);
    String usuario = (String)objSesion.getAttribute("usuario");
%>

	<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp">Canchas en Linea</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li class="active"><a href="index.jsp">Inicio</a></li>
				<li><a href="reservar.jsp">Reservar</a></li>
				<li><a href="confirmar.jsp">Gestionar reservas</a></li>
				<li><a href="escenarios.jsp">Escenarios</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
			
			<%if(usuario == null){%>
				<li><a href="registro.jsp"><span class="glyphicon glyphicon-user"></span> Registrate</a></li>
				<li><a href="sesion.jsp"><span class="glyphicon glyphicon-log-in"></span> Iniciar sesión</a></li>
			<%}else{%>
				<li><a ><span class="glyphicon glyphicon-user"></span> Bienvenido ${ usuario }</a></li>
				<li><a href="cerrarSesion.jsp"><span class="glyphicon glyphicon-log-out"></span> Cerrar Sesión</a></li>
			<%}%>
			</ul>
		</div>
	</div>
	</nav>

	<div class="container">
		<div class="row">
			<div class="col-sm-8">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
						<li data-target="#myCarousel" data-slide-to="3"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img src="image/futbol.jpg">
							<div class="carousel-caption">
								<h3>Fútbol 5 y Fútbol 11</h3>
								<p>Con grama natural o sintética.</p>
							</div>
						</div>

						<div class="item">
							<img src="image/baloncesto.jpg">
							<div class="carousel-caption">
								<h3>Baloncesto</h3>
							</div>
						</div>

						<div class="item">
							<img src="image/voleibol.jpg">
							<div class="carousel-caption">
								<h3>Voleibol</h3>
							</div>
						</div>

						<div class="item">
							<img src="image/bicicross.jpg">
							<div class="carousel-caption">
								<h3>Bicicross</h3>
							</div>
						</div>
					</div>

					<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel" role="button"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel" role="button"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="well">
					<h4>¡Bienvenidos a Canchas en linea!</h4>
					<p>El sitio donde usted puede reservar espacios deportivos en
						nuestro municipio.</p>
				</div>
				<div class="well">
					<p>Reserve en cualquier día, en el horario de 10:00 a.m. a
						11:00 p.m.</p>
				</div>
				<div class="well">
					<p>Cancele sus reservas con anticipación.</p>
				</div>
			</div>
		</div>
		<hr>
	</div>

</body>
</html>