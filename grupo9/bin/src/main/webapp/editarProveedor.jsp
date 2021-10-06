<%@page import="com.grupo9.DAO.Conexion"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editar proveedor</title>
<link rel="stylesheet" type="text/css" href="tiendagenerica2.css">
</head>
<body>

	<%
	int nit = Integer.parseInt(request.getParameter("nit"));
	Conexion conex = new Conexion();
	
	PreparedStatement consulta = conex.getConnection().prepareStatement("SELECT * FROM proveedores WHERE nit_proveedor=" + nit);
	ResultSet res = consulta.executeQuery();
	
	while (res.next()){
	%>
	
	<jsp:include page="menu.jsp"></jsp:include>
	<form class="Buscar" id="formulario" action="http://localhost:8080/editarProveedor" method="get">
	<h1>Editar Proveedor</h1><br>
		<div>
			<label>Nit</label> <input type="text" name="nit"
				value="<%=nit%>" readonly>
		</div>
		<div>
			<label>Ciudad</label> <input type="text" name="ciudadProveedor"
				value="<%=res.getString("ciudad_proveedor")%>">
		</div>
		<div>
			<label>Direccion</label> <input type="text" name="direccionProveedor"
				value="<%=res.getString("direccion_proveedor")%>">
		</div>
		<div>
			<label>Nombre</label> <input type="text" name="nombreProveedor"
				value="<%=res.getString("nombre_proveedor")%>">
		</div>
		<div>
			<label>Telefono</label> <input type="text" name="telefonoProveedor"
				value="<%=res.getString("telefono_proveedor")%>">
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