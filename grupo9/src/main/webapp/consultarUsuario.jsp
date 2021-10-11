<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="com.grupo9.DAO.Conexion"%>
    <%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Consultar Usuario</title>
<link rel="stylesheet" type="text/css" href="tiendagenerica2.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

var cedula="<%=request.getParameter("cedula")%>"
var usuario=$.ajax({
	type : "GET",
	url : "http://localhost:8080/consultarUsuario?cedulaUsuario="+cedula,
	success : function(data) {
		$.each(data, function(i, item) {
			document.getElementById("cedula").value= item.cedulaUsuario;
			document.getElementById("correo").value= item.emailUsuario;
			document.getElementById("nombre").value= item.nombreUsuario;
			document.getElementById("pass").value= item.password;
			document.getElementById("usuario").value= item.usuario;
		})
	}
	
});

</script>

</head>
<body>

<body>

    <jsp:include page="menu.jsp"></jsp:include><br>
	<form class="Buscar" id="formulario" action="" method="get">
	<h1>Datos de usuario consultado</h1><br>
<div>
		<label>Cedula</label>
		<input type = "text" name="cedulaUsuario" id="cedula" disabled="disabled">	
	</div>
	<div>
		<label>Correo</label>
		<input type = "email" name="emailUsuario" id="correo" disabled="disabled">	
	</div>
	<div>
		<label>Nombre</label>
		<input type = "text" name="nombreUsuario" id="nombre" disabled="disabled">	
	</div>
	<div>
		<label>Contraseña</label>
		<input type = "password" name="password" id="pass" disabled="disabled">	
	</div>
	<div>
		<label>Usuario</label>
		<input type = "text" name="usuario" id="usuario" disabled="disabled">	
	</div>
		<div>
			<button class="btningresar" onclick="location.href='usuarios.jsp'" type="button" class="">VOLVER</button>	
		</div>
	</form>

</body>

</body>
</html>