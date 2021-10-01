<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Agregar Cliente</title>
<link rel="stylesheet" type="text/css" href="tiendagenerica2.css">
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>
<form id="formulario2" action="http://localhost:8080/registrarCliente" method="get">
	<div>
		<label>Cedula</label>
		<input type = "text" name="cedulaCliente">	
	</div>
	<div>
		<label>Direccion</label>
		<input type = "text" name="direccionCliente">	
	</div>
	<div>
		<label>Email</label>
		<input type = "email" name="emailCliente">	
	</div>
	<div>
		<label>Nombre</label>
		<input type = "text" name="nombreCliente">	
	</div>
	<div>
		<label>Telefono</label>
		<input type = "text" name="telefonoCliente">	
	</div>
	<div>
		<input class="btningresar" type = "submit" Value="Enviar">	
	</div>
</form>
	<a href="clientes.jsp">Volver</a><br>
</body>
</html>
