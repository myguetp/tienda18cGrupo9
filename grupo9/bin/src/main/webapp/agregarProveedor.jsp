<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Agregar Proveedor</title>
<link rel="stylesheet" type="text/css" href="tiendagenerica2.css">
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>
<form id="formulario2" action="http://localhost:8080/registrarProveedor" method="get">
<h1>Registrar Proveedor</h1><br>
	<div>
		<label>NIT</label>
		<input type = "text" name="nitProveedor">	
	</div>
	<div>
		<label>Ciudad</label>
		<input type = "text" name="ciudadProveedor">	
	</div>
	<div>
		<label>Direccion</label>
		<input type = "text" name="direccionProveedor">	
	</div>
	<div>
		<label>Nombre</label>
		<input type = "text" name="nombreProveedor">	
	</div>
	<div>
		<label>Telefono</label>
		<input type = "text" name="telefonoProveedor">	
	</div>
	<div>
		<input class="btningresar" type = "submit" Value="Enviar">	
	</div>
</form>
	<a href="proveedores.jsp">Volver</a><br>
</body>
</html>
