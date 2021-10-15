<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Agregar Usuario</title>
<link rel="stylesheet" type="text/css" href="tiendagenerica2.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

function agregarUsuario() {
	var cedula=document.getElementById("cedula").value;
	var correo=document.getElementById("correo").value;
	var nombre=document.getElementById("nombre").value;
	var password=document.getElementById("pass").value;
	var usuario=document.getElementById("usuario").value;
	alert("Se va a Agregar el usuario");
	var agregar = $.ajax({
				type : "GET",
				url : "http://localhost:8080/registrarUsuario?cedulaUsuario="+cedula+"&emailUsuario="+correo+"&nombreUsuario="+nombre+"&password="+password+"&usuario="+usuario,
				success : function(data) {
					document.location.href = '/principal.jsp';
				}
	
	      }
    )
    
}

</script>

</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<form id="formulario2" action ="" method = "get" onsubmit="agregarUsuario()">
		<h1>Agregar Usuario</h1><br>
			<div>
		<label>Cedula</label>
		<input type = "text" name="cedulaUsuario" id="cedula">	
	</div>
	<div>
		<label>Correo</label>
		<input type = "email" name="emailUsuario" id="correo">	
	</div>
	<div>
		<label>Nombre</label>
		<input type = "text" name="nombreUsuario" id="nombre">	
	</div>
	<div>
		<label>Contraseña</label>
		<input type = "password" name="password" id="pass">	
	</div>
	<div>
		<label>Usuario</label>
		<input type = "text" name="usuario" id="usuario">	
	</div>
		<div>
			<input class="btningresar" type = "submit" Value="Agregar Nuevo Usuario" >
		</div>
	</form>
	<a href="usuarios.jsp">Volver</a><br>	
</body>
</html>