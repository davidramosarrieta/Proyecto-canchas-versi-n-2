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
				<li><a href="index.jsp">Inicio</a></li>
				<li class="active"><a href="reservar.jsp">Reservar</a></li>
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
	
	<%if(usuario == null){%>
	<div class="container">
		<h2>Para reservar inicie sesión:</h2>
		<form action="ServletLogin" class="form-horizontal" method="post">
			<div class="form-group">
				<label class="control-label col-sm-2">Cédula:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="cc" name="cc" onkeyup="validaInt(this.value, this.id)" required>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2">Contraseña:</label >
				<div class="col-sm-10">
					<input type="password" class="form-control" id="password" name="password" required>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-1">
					<button type="submit" class="btn btn-primary">Iniciar sesión</button>
					
				</div>
				<div class="col-sm-offset-2 col-sm-1">
					<label class="label label-danger">${ mensaje }</label>
				</div>
				
			</div>
			<label class="control-label col-sm-2"></label >
			<div>
				<a href="registro.jsp"><span class="glyphicon glyphicon-user"></span> ¿No tienes una cuenta?</a>
			</div>
		</form>
	</div>
	
	
	<%}else{%>
	<div class="container">

		<h2>Seleccione su reserva:</h2>
		<form action="ServletReserva" id="reservaForm" class="form-horizontal"
			method="post">
			<div class="form-group">
				<label class="control-label col-sm-2">Cancha:</label>
				<div class="col-sm-10">
					<select id="tipo" class="form-control" name="tipo">
						<option value="">Seleccione el tipo de cancha</option>
						<option value="Futbol 5">Futbol 5</option>
						<option value="Futbol 11">Futbol 11</option>
						<option value="Baloncesto">Baloncesto</option>
						<option value="Voleibol">Voleibol</option>
						<option value="Bicicross">Bicicross</option>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2">Fecha:</label>
				<div>
					<div class="col-xs-4">
						<select id="month" class="form-control" name="month"
							onchange="call()">
							<option value="">Mes</option>
							<option value="1">Enero</option>
							<option value="2">Febrero</option>
							<option value="3">Marzo</option>
							<option value="4">Abril</option>
							<option value="5">Mayo</option>
							<option value="6">Junio</option>
							<option value="7">Julio</option>
							<option value="8">Agosto</option>
							<option value="9">Septiembre</option>
							<option value="10">Octubre</option>
							<option value="11">Noviembre</option>
							<option value="12">Diciembre</option>
						</select>
					</div>
					<div class="col-xs-3">
						<select id="day" class="form-control" name="day">
							<option value="">Día</option>
						</select>
					</div>
					<div class="col-xs-3">
						<select id="year" class="form-control" name="year"
							onchange="call()" required>
							<option value="">Año</option>
						</select>
					</div>

				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" id="reservar" class="btn btn-primary"
						onClick="validar()" value="Reservar">
				</div>
			</div>
		</form>
	</div>
	<br>
	<div class="container">
		<label class="control-label col-sm-2"></label>
		<a href="confirmar.jsp">Confirme todas sus reservas</a>
	</div>


	<script type="text/javascript" src="fechadereserva.js"></script>
<%}%>
</body>
</html>