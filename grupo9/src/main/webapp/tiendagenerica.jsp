<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tienda Genérica</title>
<link rel="stylesheet" type="text/css" href="tiendagenerica.css">
</head>
<body>
	<form id="formulario" action="comprobarusuario.jsp" method="post" name="formulario">
		<div><h1>Bienvenidos a la Tienda Genérica</h1></div><br>
		<br>
		<div class="campos">
			<label>Usuario: </label>
			<input type="text" placeholder="~ Usuario ~" style="text-align: center" name="usuario" required>
		</div>
		<div class="campos">
			<label>Contraseña: </label>
			<input type="password" placeholder="***********" style="text-align: center" id="pwd"  name="password" required>
		</div>
		<div id="botones">
			<input class="btningresar" type="submit" name="" value="Aceptar">
			<input class="btncancelar" type="reset" name="" value="Cancelar">
		</div>
	</form>
</body>
</html>