<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editar Usuario</title>
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

<script type="text/javascript">

function editarUsuario() {
	var cedula=document.getElementById("cedula").value;
	var correo=document.getElementById("correo").value;
	var nombre=document.getElementById("nombre").value;
	var password=document.getElementById("pass").value;
	var usuario=document.getElementById("usuario").value;
	alert("Se va a ACTUALIZAR el usuario");
	var agregar = $.ajax({
				type : "GET",
				url : "http://localhost:8080/editarUsuario?cedulaUsuario="+cedula+"&emailUsuario="+correo+"&nombreUsuario="+nombre+"&password="+password+"&usuario="+usuario,
				success : function(data) {
					
				}
	      }
    )
}
</script>

</head>

<body>

	<jsp:include page="menu.jsp"></jsp:include>
	<form class="Buscar" id="formulario" action="" method="get" onsubmit="editarUsuario()">
	<h1>Editar Usuario</h1><br>
		<div>
		<label>Cedula</label>
		<input type = "text" name="cedulaUsuario" id="cedula" readonly="readonly">	
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
			<input class="btningresar" type="submit" Value="Actualizar Datos de Usuario">
		</div>
	</form>
<a href="usuarios.jsp">Volver</a><br>
</body>

</html>