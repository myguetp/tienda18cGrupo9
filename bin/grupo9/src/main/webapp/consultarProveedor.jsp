<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="com.grupo9.DAO.Conexion"%>
    <%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Consultar Proveedor</title>
<link rel="stylesheet" type="text/css" href="tiendagenerica2.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

var nit="<%=request.getParameter("nit")%>"
var proveedor=$.ajax({
	type : "GET",
	url : "http://localhost:8080/consultarProveedor?nit="+nit,
	success : function(data) {
		$.each(data, function(i, item) {
			document.getElementById("nit").value= item.nitProveedor;
			document.getElementById("ciudad").value= item.ciudadProveedor;
			document.getElementById("direccion").value= item.direccionProveedor;
			document.getElementById("nombre").value= item.nombreProveedor;
			document.getElementById("telefono").value= item.telefonoProveedor;
		})
	}
	
});

</script>

</head>
<body>

    <jsp:include page="menu.jsp"></jsp:include>
	<form class="Buscar" id="formulario" action="" method="get">
	<h1>Datos de proveedor consultado</h1><br>
		<div>
			<label>NIT</label> <input type="text" name="nitProveedor" id="nit" readonly>
		</div>
		<div>
			<label>Ciudad</label> <input type="text" name="ciudadProveedor" id="ciudad">
		</div>
		<div>
			<label>Direccion</label> <input type="text" name="direccionProveedor" id="direccion">
		</div>
		<div>
			<label>Nombre</label> <input type="text" name="nombreProveedor" id="nombre">
		</div>
		<div>
			<label>Telefono</label> <input type="text" name="telefonoProveedor" id="telefono">
		</div>
		<br>
		<div>
		<button onclick="location.href='proveedores.jsp'" type="button" class="btningresar">VOLVER</button>	
	</div>
	</form>

</body>
</html>
