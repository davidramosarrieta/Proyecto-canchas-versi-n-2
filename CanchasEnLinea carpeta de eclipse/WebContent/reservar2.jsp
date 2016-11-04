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

String tipo = (String)request.getAttribute("tipo");
String mes = (String)request.getAttribute("mes");
String dia = (String)request.getAttribute("dia");
String anno = (String)request.getAttribute("anno");
String [][] canchasDeTipo = (String[][])request.getAttribute("canchasDeTipo");

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
				<li><a ><span class="glyphicon glyphicon-user"></span> Bienvenido ${ usuario }</a></li>
				<li><a href="cerrarSesion.jsp"><span class="glyphicon glyphicon-log-out"></span> Cerrar Sesión</a></li>
			</ul>
		</div>
	</div>
	</nav>

	<div class="container">

		<h2>Seleccione cancha y horas:</h2>
		<form action="ServletReserva" id="reservaForm" class="form-horizontal"
			method="post">
			<div class="form-group">
				<label class="control-label col-sm-2">Cancha:</label>
				<div class="col-sm-10">
					<select id="tipo" class="form-control" name="tipo">
						<%if(tipo == null){ %>
						<option value="">Seleccione un tipo de cancha </option>
						<option value="Futbol 5">Futbol 5</option>
						<option value="Futbol 11">Futbol 11</option>
						<option value="Baloncesto">Baloncesto</option>
						<option value="Voleibol">Voleibol</option>
						<option value="Bicicross">Bicicross</option>
						<%}else{ %>
						<option value=<%= tipo %> > <%= tipo %> </option>
						<%}%>
					</select>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2">Fecha:</label>
				<div>
					<div class="col-xs-4">
						<select id="month" class="form-control" name="month"
							onchange="call()">
							<%if(mes == null){ %>
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
							<%}else{ %>
							<option value=<%= mes %> > <%= mes %> </option>
							<%}%>
						</select>
					</div>
					<div class="col-xs-3">
						<select id="day" class="form-control" name="day">
							<%if(dia==null){ %>
							<option value="">Día</option>
							<%}else{ %>
							<option value=<%= dia %> > <%= dia %> </option>
							<%}%>
						</select>
					</div>
					<div class="col-xs-3">
						<select id="year" class="form-control" name="year"
							onchange="call()" required>
							<%if(anno==null){ %>
							<option value="">Año</option>
							<%}else{ %>
							<option value=<%= anno %> > <%= anno %> </option>
							<%}%>
						</select>
					</div>
					
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2">Escenario:</label>
				<%if(canchasDeTipo==null){ %>
				<%}else{ %>
				<div class="col-xs-7">
					<select id="escenario" class="form-control" name="escenario"
						onchange="call()" required>
						<%for(int i = 0 ; i<canchasDeTipo.length ; i++){ 
						request.setAttribute("i", i);
						%>
						<option value=<%=canchasDeTipo[i][0]%>> Nombre: <%=canchasDeTipo[i][2]%>; Dirección: <%=canchasDeTipo[i][3]%>; Telefono: <%=canchasDeTipo[i][4]%></option>
						<%}%>
					</select>
				</div>
				<div class="col-xs-3">
					<select id="hora" class="form-control" name="hora">
						<option value="">Seleccione la hora de la reserva</option>
						<option value="10">10 a.m.</option>
						<option value="11">11 a.m.</option>
						<option value="12">12 m.</option>
						<option value="13">1 p.m.</option>
						<option value="14">2 p.m.</option>
						<option value="15">3 p.m.</option>
						<option value="16">4 p.m.</option>
						<option value="17">5 p.m.</option>
						<option value="18">6 p.m.</option>
						<option value="19">7 p.m.</option>
						<option value="20">8 p.m.</option>
						<option value="21">9 p.m.</option>
						<option value="22">10 p.m.</option>
					</select>
				</div>
			</div>
			
			<%}%>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" id="reservar" class="btn btn-primary"
						onClick="validar()" value="Reservar">
				</div>
			</div>
		</form>
	</div>

	<script type="text/javascript" src="fechadereserva.js"></script>

</body>
</html>