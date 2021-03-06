<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ventas</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		
		let infProd = [];
		
		$("#confVenta").click(function(){
			//alert("Confirmado");
			var request = $.ajax({
				url: "http://localhost:8080/registrarVenta?codigo_venta="+"0"+"&cedula_cliente="+$("#CEDULA").val()+"&cedula_usuario="+"1019132443"+"&total_venta="+$("#TVenta").val()+"&iva_venta="+$("#TI").val()+"&valor_venta="+$("#TIva").val(),
				method: "get",
				dataType: "json",
				contentType: 'application/json'
			});
			
			request.done(function(respuesta){
				var datos = JSON.stringify([
					{
						"codigo_detalle_venta":"0",
						"cantidad_producto":$("#CANTIDAD1").val(),
						"codigo_producto":$("#COD_PRODUCTO1").val(),
						"codigo_venta":respuesta.codigo_venta,
						"valor_total":$("#VT1").val()/$("#CANTIDAD1").val(),
						"valor_venta":$("#VT1").val()+$("#IVA_PRODUCTO1").val(),
						"valor_iva":$("#IC1").val()
					},
					{
						"codigo_detalle_venta":"0",
						"cantidad_producto":$("#CANTIDAD2").val(),
						"codigo_producto":$("#COD_PRODUCTO2").val(),
						"codigo_venta":respuesta.codigo_venta,
						"valor_total":$("#VT2").val()/$("#CANTIDAD2").val(),
						"valor_venta":$("#VT2").val()+$("#IVA_PRODUCTO2").val(),
						"valor_iva":$("#IC2").val()
					},
					{
						"codigo_detalle_venta":"0",
						"cantidad_producto":$("#CANTIDAD3").val(),
						"codigo_producto":$("#COD_PRODUCTO3").val(),
						"codigo_venta":respuesta.codigo_venta,
						"valor_total":$("#VT3").val()/$("#CANTIDAD3").val(),
						"valor_venta":$("#VT3").val()+$("#IVA_PRODUCTO3").val(),
						"valor_iva":$("#IC3").val()
					}
				]);
				var request = $.ajax({
					url: "http://localhost:8080/registrarDetalleVenta",
					method: "get",
					data: datos,
					dataType: "json",
					contentType: 'application/json'
				});
				
				request.done(function(respuesta){
					
				});
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
	    		$("#IVA_PRODUCTO1").val(Math.round(parseInt($("#VT1").val())*(parseInt($("#IC1").val())/100)));
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
	    		$("#IVA_PRODUCTO2").val(Math.round(parseInt($("#VT2").val())*(parseInt($("#IC2").val())/100)));
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
	    		$("#IVA_PRODUCTO3").val(Math.round(parseInt($("#VT3").val())*(parseInt($("#IC3").val())/100)));
	    		$("#TVenta").val(parseInt($("#VT1").val())+parseInt($("#VT2").val())+parseInt($("#VT3").val()));
	    		$("#TI").val(parseInt($("#IVA_PRODUCTO1").val())+parseInt($("#IVA_PRODUCTO2").val())+parseInt($("#IVA_PRODUCTO3").val()));
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
	<form>
		<table>
			<tr>
				<td><label for="CEDULA">Cedula</label></td>
				<td><input type="text" id="CEDULA"></td>
				<td><input type="button" Value="Consultar" class="btnconsultar" id="CC"></td>
				<td></td>
				<td><label for="CLIENTE">Cliente</label></td>
				<td><input type="text" id="CLIENTE"></td>
				<td><label for="CONSECUTIVO">Consecutivo</label></td>
				<td><input type="text" id="CONSECUTIVO"></td>
			</tr>
			<tr>
			  	<td></td>
			  	<th>Cod. Producto</th>
			  	<th></th>
			  	<th>Nombre Producto</th>
			  	<th>Cant</th>
			  	<th>Vlr Total</th>
			  	<th>Iva Compra</th>
			  	<th>Producto con Iva</th>
			</tr>
			<tr>
			  	<td></td>
			  	<td><input type="text" id="COD_PRODUCTO1"></td>
			  	<td><input type="button" Value="Consultar" class="btnconsultar" id="CP1"></td>
			  	<td><input type="text" id="NP1"></td>
			  	<td><center><input type="text" id="CANTIDAD1" size=5></center></td>
			  	<td><input type="text" id="VT1"></td>
			  	<td><center><input type="text" id="IC1" size=5></center></td>
			  	<td><input type="text" id="IVA_PRODUCTO1"></td>
			</tr>
			<tr>
			 	<td></td>
			 	<td><input type="text" id="COD_PRODUCTO2"></td>
			 	<td><input type="button" Value="Consultar" class="btnconsultar" id="CP2"></td>
			 	<td><input type="text" id="NP2"></td>
			 	<td><center><input type="text" id="CANTIDAD2" size=5></center></td>
			 	<td><input type="text" id="VT2"></td>
			 	<td><center><input type="text" id="IC2" size=5></center></td>
			 	<td><input type="text" id="IVA_PRODUCTO2"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="text" id="COD_PRODUCTO3"></td>
    			<td><input type="button" Value="Consultar" class="btnconsultar" id="CP3"></td>
    			<td><input type="text" id="NP3"></td>
    			<td><center><input type="text" id="CANTIDAD3" size=5></center></td>
    			<td><input type="text" id="VT3"></td>
    			<td><center><input type="text" id="IC3" size=5></center></td>
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
    			<td><input type="button" Value="Confirmar" class="btnconfirmar" id="confVenta"></td>
    			<td><label for="TIva">Total con Iva</label></td>
    			<td><input type="text" id="TIva"></td>
  			</tr>
		</table>
	</form>
</body>
</html>