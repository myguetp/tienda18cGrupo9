<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reportes</title>

</head>
<body>

	<jsp:include page="menu.jsp"></jsp:include><br>
	<h1>Reportes</h1>
	<div>
		<input type="button" Value="Listado de Usuarios" class="btnreportes" onclick="location.href='reporteUsuarios.jsp'">
	</div>
	<div>
		<input type="button" Value="Listado de Clientes" class="btnreportes" onclick="location.href='reporteClientes.jsp'">
	</div>
	<div>
		<input type="button" Value="Listado de Proveedores" class="btnreportes" onclick="location.href='reporteProveedores.jsp'">
	</div>
	<div>
		<input type="button" Value="Listado de Productos" class="btnreportes" onclick="location.href='reporteProductos.jsp'">
	</div>
	<div>
		<input type="button" Value="Total Ventas Por Cliente" class="btnreportes" onclick="location.href='reporteVentasXcliente.jsp'">
	</div>
	<div>
		<input type="button" Value="Detalle Ventas" class="btnreportes" onclick="location.href='reporteDetalleVentas.jsp'">
	</div>

</body>
</html>