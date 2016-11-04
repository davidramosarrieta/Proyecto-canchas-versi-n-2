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
    HttpSession objSesion = request.getSession(true);
	objSesion.removeAttribute("usuario");
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
				<li><a href="index.jsp">Inicio</a></li>
				<li><a href="reservar.jsp">Reservar</a></li>
				<li><a href="confirmar.jsp">Gestionar reservas</a></li>
				<li><a href="escenarios.jsp">Escenarios</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="active"><a href="registro.jsp"><span
						class="glyphicon glyphicon-user"></span> Registrate</a></li>
				<li><a href="sesion.jsp"><span
						class="glyphicon glyphicon-log-in"></span> Iniciar sesión</a></li>
			</ul>
		</div>
	</div>
	</nav>

	<div class="container">
		<br>
		<br>
		<h4>Su sesión ha finalizado exitosamente</h4>
		<br>
		<br>
		<p>Hasta pronto</p>

	</div>

</body>
</html>