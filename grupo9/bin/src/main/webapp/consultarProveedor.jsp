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
</head>
<body>

<body>

	
	<%
	int nit = Integer.parseInt(request.getParameter("nit"));
	Conexion conex = new Conexion();

	PreparedStatement consulta = conex.getConnection().prepareStatement("SELECT * FROM proveedores WHERE nit_proveedor=" + nit);
	ResultSet res = consulta.executeQuery();

	while (res.next()) {
	%>
    <jsp:include page="menu.jsp"></jsp:include><br>
	<form class="Buscar" id="formulario" action="http://localhost:8080/editarProveedor" method="get">
	<h1>Datos de proveedor consultado</h1><br>
		<div>
			<label>NIT</label> <input type="text" name="nitProveedor"
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
			<input class="btningresar" type="submit" Value="Actualizar Proveedor"> 
			
			<button  class="btningresar" onclick="location.href='eliminarProveedor?nit=<%=nit%>'" type="button" class="">Eliminar Proveedor</button>
		</div>
	</form>

	<%
	}
	%>
</body>

</body>
</html>
