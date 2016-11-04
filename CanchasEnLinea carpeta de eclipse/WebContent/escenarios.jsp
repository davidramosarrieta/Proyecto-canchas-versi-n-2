<%@page import="control.db.Consultas"%>
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

	HttpSession objSesion = request.getSession(false);
	String usuario = (String)objSesion.getAttribute("usuario");
	
	Consultas con = new Consultas();
	int nivelDeUsuario = con.nivelDelUsuario(usuario);
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
				<li class="active"><a href="escenarios.jsp">Escenarios</a></li>
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
	
	<% if(nivelDeUsuario==2){ %>
		<div class="container">
		<h1> Administración de escenarios </h1>
	</div>
	
	<div class="container">
		<h2> ${ mensaje } </h2>
	</div>

	<div class="container">

		<h2> Agregar escenario:</h2>
		<form action="escenario" class="form-horizontal" method="post">
			<div class="form-group">
				<label class="control-label col-sm-2">Tipo:</label>
				<div class="col-sm-10">
					<select id="tipo" class="form-control" name="tipo" >
							<option value="Futbol 5">Futbol 5</option>
							<option value="Futbol 11">Futbol 11</option>
							<option value="Baloncesto">Baloncesto</option>
							<option value="Voleibol">Voleibol</option>
							<option value="Bicicross">Bicicross</option>
						</select>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2">Nombre del escenario:</label >
				<div class="col-sm-10">
					<input type="text" class="form-control" id="nombre" name="nombre" required>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2">Dirección:</label>
				
				<div class="col-sm-10">
					<input type="text" class="form-control" id="address" name="direccion" required>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2">Teléfono:</label >
				<div class="col-sm-10">
					<input type="text" class="form-control" id="phone"
						onkeyup="validaInt(this.value, this.id)" name="telefono" required>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-primary">Guardar escenario</button>
				</div>
			</div>
		</form>
	</div>
	
	<div class="container">

		<h2> Borrar escenario:</h2>
		<form action="escenario" class="form-horizontal" method="post">
			<div class="form-group">
				<label class="control-label col-sm-2">Tipo:</label>
				<div class="col-xs-7">
					<select id="borrarEscenario" class="form-control" name="borrarEscenario">
						<option value=""> Seleccione el escenario a borrar</option>
						<%
						Consultas co = new Consultas();
						String canchasDeTipo [][] = co.consultaTodasCanchas();
						for(int i = 0 ; i<canchasDeTipo.length ; i++){ 
						request.setAttribute("i", i);
						%>
						<option value=<%=canchasDeTipo[i][0]%>> Nombre: <%=canchasDeTipo[i][2]%>; Dirección: <%=canchasDeTipo[i][3]%>; Telefono: <%=canchasDeTipo[i][4]%></option>
						<%}%>
					</select>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-primary">Borrar escenario</button>
				</div>
			</div>
		</form>
	</div>
	<% } else{%>
		<div class="container">
			<h2> Espacio para administradores:</h2><br>
			<h3> Inicie sesión como administrador:</h3>
			<a href="sesion.jsp"><span class="glyphicon glyphicon-log-in"></span> Iniciar sesión</a>
		</div>
	<%} %>

</body>
</html>