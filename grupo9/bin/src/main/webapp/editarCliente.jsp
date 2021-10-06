<%@page import="com.grupo9.DAO.Conexion"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editar cliente</title>
<link rel="stylesheet" type="text/css" href="tiendagenerica2.css">
</head>
<body>

	<%
	int cedula = Integer.parseInt(request.getParameter("cedula"));
	Conexion conex = new Conexion();
	
	PreparedStatement consulta = conex.getConnection().prepareStatement("SELECT * FROM clientes WHERE cedula_cliente=" + cedula);
	ResultSet res = consulta.executeQuery();
	
	while (res.next()){
	%>
	
	<jsp:include page="menu.jsp"></jsp:include>
	<form class="Buscar" id="formulario" action="http://localhost:8080/editarCliente" method="get">
	<h1>Editar Cliente</h1><br>
		<div>
			<label>Cedula</label> <input type="text" name="cedulaCliente"
				value="<%=cedula%>" readonly>
		</div>
		<div>
			<label>Direccion</label> <input type="text" name="direccionCliente"
				value="<%=res.getString("direccion_cliente")%>">
		</div>
		<div>
			<label>Email</label> <input type="email" name="emailCliente"
				value="<%=res.getString("email_cliente")%>">
		</div>
		<div>
			<label>Nombre</label> <input type="text" name="nombreCliente"
				value="<%=res.getString("nombre_cliente")%>">
		</div>
		<div>
			<label>Telefono</label> <input type="text" name="telefonoCliente"
				value="<%=res.getString("telefono_cliente")%>">
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