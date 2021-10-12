<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="com.grupo9.DAO.Conexion"%>
    <%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Consultar Cliente</title>
<link rel="stylesheet" type="text/css" href="tiendagenerica2.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

var cedula="<%=request.getParameter("documento")%>"
var usuario=$.ajax({
	type : "GET",
	url : "http://localhost:8080/consultarCliente?cedulaCliente="+documento,
	success : function(data) {
		$.each(data, function(i, item) {
			document.getElementById("cedula").value= item.cedulaCliente;
			document.getElementById("direccion").value= item.direccionCliente;
			document.getElementById("correo").value= item.emailCliente;
			document.getElementById("nombre").value= item.nombreCliente;
			document.getElementById("telefono").value= item.telefonoCliente;
		})
	}
	
});

</script>
</head>
<body>

<body>

    <jsp:include page="menu.jsp"></jsp:include><br>
		<form class="Buscar" id="formulario" action="" method="get">
	<h1>Datos de cliente consultado</h1><br>
<div>
		<label>Cedula</label>
		<input type = "text" name="cedulaCliente" id="cedula" >	
	</div>
	<div>
		<label>Direccion</label>
		<input type = "text" name="direccionCliente" id="direccion">	
	</div>
	<div>
		<label>Correo</label>
		<input type = "text" name="emailCliente" id="correo" >	
	</div>
	<div>
		<label>Nombre</label>
		<input type = "text" name="nombreCliente" id="nombre" >	
	</div>

	<div>
		<label>Telefono</label>
		<input type = "text" name="telefonoCliente" id="telefono" >	
	</div>
		<div>
			<button class="btningresar" onclick="location.href='clientes.jsp'" type="button" class="">VOLVER</button>	
		</div>
	</form>

	
</body>

</body>
</html>