package com.grupo9.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.swing.JOptionPane;

import com.grupo9.DTO.ProductoDTO;

public class ProductoDAO {
	PreparedStatement preparedStatement;
	
	public ArrayList <ProductoDTO> listaDeProducto(){
		ArrayList <ProductoDTO> miProducto=new ArrayList <ProductoDTO>();
		Conexion conex=new Conexion();
	
	try {
		PreparedStatement consulta=conex.getConnection().prepareStatement("SELECT * FROM productos");
		ResultSet res=consulta.executeQuery();
		while(res.next()) {
			ProductoDTO producto=new ProductoDTO();
			producto.setCodigoProducto(Integer.parseInt(res.getString("codigo_producto")));
			producto.setIvaCompra(Double.parseDouble(res.getString("iva_compra")));
			producto.setNitProveedor(Integer.parseInt(res.getString("nit_proveedor")));
			producto.setNombreProducto(res.getString("nombre_producto"));
			producto.setPrecioCompra(Double.parseDouble(res.getString("precio_compra")));
			producto.setPrecioVenta(Double.parseDouble(res.getString("precio_venta")));
			
			miProducto.add(producto);
		}
		res.close();
		consulta.close();
		conex.desconectar();
	}catch(Exception e) {
		JOptionPane.showMessageDialog(null, "No se puede realizar la consulta" + e);
	}
	return miProducto;
	}
	public void registrarProducto(ProductoDTO producto) {
		Conexion conex=new Conexion();
	try {
		Statement st=conex.getConnection().createStatement();
		st.executeUpdate("INSERT INTO productos VALUES('"+producto.getCodigoProducto()+"', '"+producto.getIvaCompra()+"', '"+producto.getNitProveedor()+"', '"+producto.getNombreProducto()+"', '"+producto.getPrecioCompra()+"', '"+producto.getPrecioVenta()+"')");
		st.close();
		conex.desconectar();
	}catch(Exception e) {
		System.out.println(e.getMessage());
	}
		
	}
	public ArrayList <ProductoDTO> consultarProducto(int codigo){
		ArrayList <ProductoDTO> miProducto=new ArrayList <ProductoDTO>();
		Conexion conex=new Conexion();
		try {
			PreparedStatement consulta=conex.getConnection().prepareStatement("SELECT * FROM productos WHERE codigo_producto=?");
			consulta.setInt(1, codigo);
			ResultSet res=consulta.executeQuery();
			if(res.next()) {
				ProductoDTO producto=new ProductoDTO();
				producto.setCodigoProducto(Integer.parseInt(res.getString("codigo_producto")));
				producto.setIvaCompra(Double.parseDouble(res.getString("iva_compra")));
				producto.setNitProveedor(Integer.parseInt(res.getString("nit_proveedor")));
				producto.setNombreProducto(res.getString("nombre_producto"));
				producto.setPrecioCompra(Double.parseDouble(res.getString("precio_compra")));
				producto.setPrecioVenta(Double.parseDouble(res.getString("precio_venta")));
				
				miProducto.add(producto);
			}
			res.close();
			consulta.close();
			conex.desconectar();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return miProducto;
	}
	
	public void editarProducto(ProductoDTO producto) {
		Conexion conex = new Conexion();
        try {
        	Statement st = conex.getConnection().createStatement();
        	st.executeUpdate("UPDATE productos SET codigo_producto = '"+producto.getCodigoProducto()+"',iva_compra='"+producto.getIvaCompra()+"',nit_proveedor='"+producto.getNitProveedor()+"',nombre_producto='"+producto.getNombreProducto()+"',precio_compra='"+producto.getPrecioCompra()+"',precio_venta='"+producto.getPrecioVenta()+"' WHERE codigo_producto ='"+producto.getCodigoProducto()+"'");
            st.close();
            conex.desconectar();      
        }catch(Exception e) {
            System.out.println(e.getMessage());
        }
		
	}
}
