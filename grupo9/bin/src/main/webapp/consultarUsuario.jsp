<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="com.grupo9.DAO.Conexion"%>
    <%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Consultar Usuario</title>
<link rel="stylesheet" type="text/css" href="tiendagenerica2.css">
</head>
<body>

<body>

	
	<%
	int cedula = Integer.parseInt(request.getParameter("cedula"));
	Conexion conex = new Conexion();

	PreparedStatement consulta = conex.getConnection().prepareStatement("SELECT * FROM usuarios WHERE cedula_usuario=" + cedula);
	ResultSet res = consulta.executeQuery();

	while (res.next()) {
	%>
    <jsp:include page="menu.jsp"></jsp:include><br>
	<form class="Buscar" id="formulario" action="http://localhost:8080/editarUsuario" method="get">
	<h1>Datos de usuario consultado</h1><br>
		<div>
			<label>Cedula</label> <input type="text" name="cedulaUsuario"
				value="<%=cedula%>" readonly>
		</div>
		<div>
			<label>Correo</label> <input type="email" name="emailUsuario"
				value="<%=res.getString("email_usuario")%>">
		</div>
		<div>
			<label>Nombre</label> <input type="text" name="nombreUsuario"
				value="<%=res.getString("nombre_usuario")%>">
		</div>
		<div>
			<label>Contraseņa</label> <input type="password" name="password"
				value="<%=res.getString("password")%>">
		</div>
		<div>
			<label>Usuario</label> <input type="text" name="usuario"
				value="<%=res.getString("usuario")%>">
		</div>
		<div>
			<input class="btningresar" type="submit" Value="Actualizar Usuario"> 
			
			<button  class="btningresar" onclick="location.href='eliminarUsuario?cedula=<%=cedula%>'" type="button" class="">Eliminar Usuario</button>
		</div>
	</form>

	<%
	}
	%>
</body>

</body>
</html>