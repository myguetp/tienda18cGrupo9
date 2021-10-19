<%@page import="com.grupo9.DAO.Conexion"%>
<%@ page import ="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ventas</title>
<link rel="stylesheet" type="text/css" href="tiendagenerica.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">


.ventas{
	
	text-align: center;
    width: 100%;	
    	
}

.ventabla{
margin:auto;
}
.ventas td{
 
 text-align:center;
 padding: 0%;
}
.btnventas {
	text-decoration: none;
	margin-top: 40px;
	margin-left: 10px;
	padding: 5px;
	font-weight: 200;
	font-size: 18px;
	color: #ffffff;
    background-color: #21201F;
    border-radius: 3px;
	cursor: pointer;
}
.btnventas {
padding: 0%;
margin:0%;
	text-decoration: none;
	

	font-weight: 200;
	font-size: 16px;
	color: #ffffff;
    background-color: #21201F;
    border-radius: 3px;
	cursor: pointer;
}

</style>
</head>
<script type="text/javascript">
	$(document).ready(function(){		
		
		let infProd = [];
		
		$("#confVenta").click(function(){
			alert("La venta sera registrada");
			var request = $.ajax({
				url: "http://localhost:8080/registrarVenta?codigo_venta="+$("#CONSECUTIVO").val()+"&cedula_cliente="+$("#CEDULA").val()+"&cedula_usuario="+"2"+"&total_venta="+$("#TVenta").val()+"&iva_venta="+$("#TI").val()+"&valor_venta="+$("#TIva").val(),
				method: "get",
				dataType: "json",
				contentType: 'application/json'
					  
			});
			window.location.assign("http://localhost:8080/contenido.jsp")
			request.done(function(respuesta){
				
			});
			
			//Detalle Productos
			var request = $.ajax({
				url: "http://localhost:8080/registrarDetalleVenta?codigo_detalle_venta="+"0"+"&cantidad_producto="+$("#CANTIDAD1").val()+"&codigo_producto="+$("#COD_PRODUCTO1").val()+"&codigo_venta="+$("#CONSECUTIVO").val()+"&valor_total="+$("#VT1").val()/$("#CANTIDAD1").val()+"&valor_venta="+$("#VT1").val()+$("#IVA_PRODUCTO1").val()+"&valor_iva="+$("#IC1").val(),
				method: "get",
				dataType: "json",
				contentType: 'application/json'
			});
			
			request.done(function(respuesta){
				
			});
			
			var request = $.ajax({
				url: "http://localhost:8080/registrarDetalleVenta?codigo_detalle_venta="+"0"+"&cantidad_producto="+$("#CANTIDAD2").val()+"&codigo_producto="+$("#COD_PRODUCTO2").val()+"&codigo_venta="+$("#CONSECUTIVO").val()+"&valor_total="+$("#VT2").val()/$("#CANTIDAD2").val()+"&valor_venta="+$("#VT2").val()+$("#IVA_PRODUCTO2").val()+"&valor_iva="+$("#IC2").val(),
				method: "get",
				dataType: "json",
				contentType: 'application/json'
			});
			
			request.done(function(respuesta){
				
			});
			
			var request = $.ajax({
				url: "http://localhost:8080/registrarDetalleVenta?codigo_detalle_venta="+"0"+"&cantidad_producto="+$("#CANTIDAD3").val()+"&codigo_producto="+$("#COD_PRODUCTO3").val()+"&codigo_venta="+$("#CONSECUTIVO").val()+"&valor_total="+$("#VT3").val()/$("#CANTIDAD3").val()+"&valor_venta="+$("#VT3").val()+$("#IVA_PRODUCTO3").val()+"&valor_iva="+$("#IC3").val(),
				method: "get",
				dataType: "json",
				contentType: 'application/json'
			});
			
			request.done(function(respuesta){
				
			});
			
		});
		
		$("#CC").click(function(){
			var request = $.ajax({
				url: "http://localhost:8080/consultarCliente?cedulaCliente="+$("#CEDULA").val(), 
	    		method: "get", 
	    		dataType: "json",
	    		contentType:'application/json'
	    	});
		
	    	request.done(function(respuesta) {
	    		$("#CLIENTE").val(respuesta[0].nombreCliente);
	    	});
		
	    	request.fail(function(jqXHR, textStatus) {
	        	alert("Hubo un error: " + textStatus);
	    	});
		});
	    
	    $("#CP1").click(function(){
			var request = $.ajax({
				url: "http://localhost:8080/consultarProducto?codigo="+$("#COD_PRODUCTO1").val(), 
	    		method: "get", 
	    		dataType: "json",
	    		contentType:'application/json'
	    	});
		
	    	request.done(function(respuesta) {
	    		$("#NP1").val(respuesta[0].nombreProducto);
	    		$("#VT1").val(respuesta[0].precioVenta*parseInt($("#CANTIDAD1").val()));
	    		$("#IC1").val(respuesta[0].ivaCompra);
	    		$("#IVA_PRODUCTO1").val(Math.round(parseInt($("#VT1").val())*(parseInt($("#IC1").val())/100)+parseInt($("#VT1").val())));
	    		infProd.push(respuesta);
	    	
	    	});
	    	
	    	request.fail(function(jqXHR, textStatus) {
	        	alert("Hubo un error: " + textStatus);
	    	});
		});
	    
	    $("#CP2").click(function(){
			var request = $.ajax({
				url: "http://localhost:8080/consultarProducto?codigo="+$("#COD_PRODUCTO2").val(), 
	    		method: "get", 
	    		dataType: "json",
	    		contentType:'application/json'
	    	});
		
	    	request.done(function(respuesta) {
	    		$("#NP2").val(respuesta[0].nombreProducto);
	    		$("#VT2").val(respuesta[0].precioVenta*parseInt($("#CANTIDAD2").val()));
	    		$("#IC2").val(respuesta[0].ivaCompra);
	    		$("#IVA_PRODUCTO2").val(Math.round(parseInt($("#VT2").val())*(parseInt($("#IC2").val())/100)+parseInt($("#VT2").val())));
	    		infProd.push(respuesta);
	    	});
	    	
	    	request.fail(function(jqXHR, textStatus) {
	        	alert("Hubo un error: " + textStatus);
	    	});
		});
	    
	    $("#CP3").click(function(){
			var request = $.ajax({
				url: "http://localhost:8080/consultarProducto?codigo="+$("#COD_PRODUCTO3").val(), 
	    		method: "get", 
	    		dataType: "json",
	    		contentType:'application/json'
	    	});
		
	    	request.done(function(respuesta) {
	    		$("#NP3").val(respuesta[0].nombreProducto);
	    		$("#VT3").val(respuesta[0].precioVenta*parseInt($("#CANTIDAD3").val()));
	    		$("#IC3").val(respuesta[0].ivaCompra);
	    		$("#IVA_PRODUCTO3").val(Math.round(parseInt($("#VT3").val())*(parseInt($("#IC3").val())/100)+parseInt($("#VT3").val())));
	    		$("#TVenta").val(parseInt($("#VT1").val())+parseInt($("#VT2").val())+parseInt($("#VT3").val()));
	    		$("#TI").val(parseInt($("#VT1").val()*$("#IC1").val()/100)+parseInt($("#VT2").val()*$("#IC2").val()/100)+parseInt($("#VT3").val()*$("#IC3").val()/100));
	    		$("#TIva").val(parseInt($("#TVenta").val())+parseInt($("#TI").val()));
	    		infProd.push(respuesta);
	    	});
	    	
	    	request.fail(function(jqXHR, textStatus) {
	        	alert("Hubo un error: " + textStatus);
	    	});
		});
	    
	});
</script>

<body>
<jsp:include page="menu.jsp"></jsp:include><br>
	<form class="ventas">
	<h1>Ventas</h1><br>
		<table class="ventabla">
			<tr>
				<td><label for="CEDULA">Cedula</label></td>
				<td><input type="text" id="CEDULA"></td>
				<td><input type="button" Value="Consultar" class="btnventas" id="CC"></td>
				<td></td>
				<td><label for="CLIENTE">Cliente</label></td>
				<td><input type="text" id="CLIENTE"></td>
				<td><label for="CONSECUTIVO">Consecutivo</label></td>
				<%
	
	Conexion conex = new Conexion();
	int incremeto = 1;
	PreparedStatement consulta = conex.getConnection().prepareStatement("select MAX(codigo_venta) as codigo_venta from ventas");
	ResultSet res = consulta.executeQuery();

	while (res.next()) {
	%>
				<td><input type="text" id="CONSECUTIVO" value="<%=res.getInt("codigo_venta")+incremeto%>"></td>
				<%
	}

	res.close();
    consulta.close();
    conex.desconectar();
	%>
			</tr>
			<tr>
			  	<td></td>
			  	<th>Cod. Producto</th>
			  	<th>Cant</th>
			  	<th></th>
			  	<th>Nombre Producto</th>
			  	<th>Vlr Total</th>
			  	<th>Iva Compra</th>
			  	<th>Producto con Iva</th>
			</tr>
			<tr>
			  	<td></td>
			  	<td><input type="text" id="COD_PRODUCTO1"></td>
			  	<td><input type="text" id="CANTIDAD1" size=5></td>
			  	<td><input type="button" Value="Consultar" class="btnventas" id="CP1"></td>
			  	<td><input type="text" id="NP1"></td>
			  	
			  	<td><input type="text" id="VT1"></td>
			  	<td><input type="text" id="IC1" size=5></td>
			  	<td><input type="text" id="IVA_PRODUCTO1"></td>
			</tr>
			<tr>
			 	<td></td>
			 	<td><input type="text" id="COD_PRODUCTO2"></td>
			 	 	<td><input type="text" id="CANTIDAD2" size=5></td>
			 	<td><input type="button" Value="Consultar" class=btnventas id="CP2"></td>
			 	<td><input type="text" id="NP2"></td>
			
			 	<td><input type="text" id="VT2"></td>
			 	<td><input type="text" id="IC2" size=5></td>
			 	<td><input type="text" id="IVA_PRODUCTO2"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="text" id="COD_PRODUCTO3"></td>
				<td><input type="text" id="CANTIDAD3" size=5></td>
    			<td><input type="button" Value="Consultar" class=btnventas id="CP3"></td>
    			<td><input type="text" id="NP3"></td>
    			
    			<td><input type="text" id="VT3"></td>
    			<td><input type="text" id="IC3" size=5></td>
    			<td><input type="text" id="IVA_PRODUCTO3"></td>
  			</tr>
  			<tr>
  				<td></td>
  				<td></td>
    			<td></td>
    			<td></td>
    			<td><label for="TVenta">Total Venta</label></td>
    			<td><input type="text" id="TVenta"></td>
    			<td><label for="TI">Total Iva</label></td>
    			<td><input type="text" id="TI"></td>
  			</tr>
  			<tr>
  				<td></td>
  				<td></td>
    			<td></td>
    			<td></td>
    			<td></td>
    			<td><input type="button" Value="Confirmar" class=btnventas id="confVenta"></td>
    			<td><label for="TIva">Total con Iva</label></td>
    			<td><input type="text" id="TIva"></td>
  			</tr>
		</table>
	</form>
</body>
</html>