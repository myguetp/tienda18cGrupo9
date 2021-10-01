<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Agregar Proveedor</title>
</head>
<body>
<a href="proveedores.jsp">Volver</a><br>
<form action="http://localhost:8080/registrarProveedor" method="get">
registarProveedor
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
		<input type = "submit" Value="Enviar">	
	</div>
</form>
</body>
</html>