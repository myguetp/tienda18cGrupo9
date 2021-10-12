<%@page import="com.grupo9.DAO.Conexion"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editar producto</title>
<link rel="stylesheet" type="text/css" href="tiendagenerica2.css">
</head>
<body>
	<%
	int codigo = Integer.parseInt(request.getParameter("codigo"));
	Conexion conex = new Conexion();
	
	PreparedStatement consulta = conex.getConnection().prepareStatement("SELECT * FROM productos WHERE codigo_producto=" + codigo);
	ResultSet res = consulta.executeQuery();
	
	while (res.next()){
	%>
	
	<jsp:include page="menu.jsp"></jsp:include>
	<form id="formulario2" action="http://localhost:8080/editarProducto" method="get">
	<h1>Editar Producto</h1><br>
		<div>
			<label>codigoProducto</label> <input type="text" name="codigoProducto"
				value="<%=codigo%>" readonly>
		</div>
		<div>
			<label>Iva</label> <input type="text" name="ivaCompra"
				value="<%=res.getString("iva_compra")%>">
		</div>
		<div>
			<label>Nit</label> <input type="text" name="nitProveedor"
				value="<%=res.getString("nit_proveedor")%>">
		</div>
		<div>
			<label>Nombre</label> <input type="text" name="nombreProducto"
				value="<%=res.getString("nombre_producto")%>">
		</div>
		<div>
			<label>Compra</label> <input type="text" name="precioCompra"
				value="<%=res.getString("precio_compra")%>">
		</div>
			<div>
			<label>Venta</label> <input type="text" name="precioVenta"
				value="<%=res.getString("precio_venta")%>">
		</div>
		
		<div>
			<input class="btningresar" type="submit" Value="Enviar">
		</div>
	</form>
	<%
	}
	%>

</body>
</html>
