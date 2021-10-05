<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Consultar Usuario</title>
<link rel="stylesheet" type="text/css" href="tiendagenerica2.css">
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<form id="formulario2" action="/consultarUsuario" method = "post">
		<h1>Consultar Usuario</h1><br>
		<div>
			<label>Cedula:</label>
			<input type = "text" name = "cedula" required>
		</div>
		<div>
			<label>Correo:</label>
			<input type = "text" name = "correo">
		</div>
		<div>
			<label>Nombre:</label>
			<input type = "text" name = "nombre">
		</div>
		<div>
			<label>Contraseña:</label>
			<input type = "text" name = "password">
		</div>
		<div>
			<label>Usuario:</label>
			<input type = "text" name = "usuario">
		</div>
		<div>
			<input class="btningresar" type = "submit">
		</div>
	</form>	
</body>
</html>