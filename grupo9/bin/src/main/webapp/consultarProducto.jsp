<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.grupo9.DAO.Conexion"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Consultar Producto</title>
<link rel="stylesheet" type="text/css" href="tiendagenerica2.css">
</head>
<body>

<%
	int codigo = Integer.parseInt(request.getParameter("codigo"));
	Conexion conex = new Conexion();

	PreparedStatement consulta = conex.getConnection().prepareStatement("SELECT * FROM productos WHERE codigo_producto=" + codigo);
	ResultSet res = consulta.executeQuery();

	while (res.next()) {
	%>
    <jsp:include page="menu.jsp"></jsp:include><br>
	<form class="Buscar" id="formulario" action="http://localhost:8080/editarProducto" method="get">
	<h1>Datos de producto consultado</h1><br>
		<div>
			<label>Codigo Producto</label> <input type="text" name="codigoProducto"
				value="<%=codigo%>" readonly>
		</div>
		<div>
			<label>IVA</label> <input type="text" name="ivaCompra"
				value="<%=res.getString("iva_compra")%>">
		</div>
		<div>
			<label>NIT</label> <input type="text" name="nitProveedor"
				value="<%=res.getString("nit_proveedor")%>">
		</div>
		<div>
			<label>Nombre</label> <input type="text" name="nombreProducto"
				value="<%=res.getString("nombre_producto")%>">
		</div>
		<div>
			<label>Precio Compra</label> <input type="text" name="precioCompra"
				value="<%=res.getString("precio_compra")%>">
		</div>
		<div>
			<label>Precio Venta</label> <input type="text" name="precioVenta"
				value="<%=res.getString("precio_venta")%>">
		</div>
		<div>
			<input class="btningresar" type="submit" Value="Actualizar Producto"> 
			
		</div>
	</form>

	<%
	}
	%>

</body>
</html>
