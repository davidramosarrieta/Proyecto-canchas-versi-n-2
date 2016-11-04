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
	HttpSession objSesion = request.getSession(false);
    String usuario = (String)objSesion.getAttribute("usuario");
    
    String mensaje = (String)request.getAttribute("mensaje");
	request.setAttribute("mensaje", mensaje);
	
	Consultas coReservas = new Consultas();
	String misReservas[][] = coReservas.listarReservas(usuario);
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
					<li class="active"><a href="confirmar.jsp">Gestionar reservas</a></li>
					<li><a href="escenarios.jsp">Escenarios</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a ><span class="glyphicon glyphicon-user"></span> Bienvenido ${ usuario }</a></li>
					<li><a href="cerrarSesion.jsp"><span class="glyphicon glyphicon-log-out"></span> Cerrar Sesión</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	<div class="container">
		<h2>Sus reservas</h2>
		<br>
		<h3>${ mensaje }</h3>
	</div>
	<form action="ServletReserva" id="reservaForm" class="form-horizontal"
		method="post">
		<div class="form-group">
			<label class="control-label col-sm-2">Seleccione las reservas:</label>
			<%if(misReservas==null){ %>
			<%}else{ %>
			<div class="col-xs-7">
				
					<%for(int i = 0 ; i<misReservas.length ; i++){ 
					request.setAttribute("i", i);
					%>
					<input type="checkbox" name=<%=i%> value=<%=misReservas[i][0]%>>Id Reserva: <%=misReservas[i][0]%>; Id Escenario: <%=misReservas[i][1]%>; Hora: <%=misReservas[i][3]%>;  Dia: <%=misReservas[i][4]%>;  Mes: <%=misReservas[i][5]%>;  Año: <%=misReservas[i][6]%>;  Estado: <%=misReservas[i][7]%><br>

					<%}%>
			</div>
		</div>
			<div class="form-group">
				<label class="control-label col-sm-2">Seleccione el proceso:</label>
				<div class="col-xs-7">
					<select id="confirmarEliminar" class="form-control" name="confirmarEliminar" required>
						<option value="">Seleccione la opcion</option>
						<option value="confirmar">Confirmar</option>
						<option value="eliminar">Eliminar</option>
					</select>
				</div>
			<%}%>
			</div>
		
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-primary">Ejecutar la operación solicitada</button>
			</div>
		</div>
	</form>
	
</body>
</html>