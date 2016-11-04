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

	String mensaje = (String)request.getAttribute("mensaje");

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

		<h2> ${ mensaje } - Datos básicos:</h2>
		<form action="ServletRegistro" class="form-horizontal" method="post">
			<div class="form-group">
				<label class="control-label col-sm-2">Cédula:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="cc" name="cc"
						onkeyup="validaInt(this.value, this.id)" required>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2">Contraseña:</label required>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="password"
						name="password">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2">Repetir contraseña:</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="password2"
						onfocusout="validaPass(this.value, this.id)">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2">Nombre:</label required>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="idNombre" name="nombre">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2">Apellido:</label required>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="idApellido"
						name="apellido">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2">Dirección:</label required>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="address"
						name="direccion">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2">Teléfono:</label required>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="phone"
						onkeyup="validaInt(this.value, this.id)" name="telefono">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2">Fecha de Nacimiento:</label>
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
				<label class="control-label col-sm-2">Edad:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="edad" name="edad">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-primary">Enviar</button>
				</div>
			</div>
		</form>
	</div>

	<script type="text/javascript" src="fechadenacimiento.js"></script>

</body>
</html>