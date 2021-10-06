package com.grupo9.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.swing.JOptionPane;

import com.grupo9.DTO.ProductoDTO;

public class ProductoDAO {
	
	PreparedStatement preparedStatement;
	
	public ArrayList<ProductoDTO> listaDeProducto() {
		ArrayList<ProductoDTO> miProducto = new ArrayList<>();
		Conexion conex = new Conexion();
		
		try {
			PreparedStatement consulta = conex.getConnection().prepareStatement("SELECT * FROM productos");
			ResultSet res = consulta.executeQuery();
			while(res.next()) {
				ProductoDTO producto = new ProductoDTO();
				producto.setCodigoProducto(res.getInt("codigo_producto"));
				producto.setIvaCompra(res.getDouble("iva_compra"));
				producto.setNitProveedor(res.getInt("nit_proveedor"));
				producto.setNombreProducto(res.getString("nombre_producto"));
				producto.setPrecioCompra(res.getDouble("precio_compra"));
				producto.setPrecioVenta(res.getDouble("precio_venta"));
				miProducto.add(producto); 
					}
					res.close();
					consulta.close();
					conex.desconectar();
		
			}
		catch(Exception e) {
			JOptionPane.showMessageDialog(null, "no se pudo realizar consulta"+e);
		}
		return miProducto;
	}
	

	public void registrarProducto(ProductoDTO producto) {
		Conexion conex = new Conexion();
		try {
			Statement st = conex.getConnection().createStatement();
			st.executeUpdate("INSERT INTO productos VALUES ('"+producto.getCodigoProducto()+"', '"+producto.getIvaCompra()+"', '"+producto.getNitProveedor()+"', '"+producto.getNombreProducto()+"', '"+producto.getPrecioCompra()+"', '"+producto.getPrecioVenta()+"')");
			//JOptionPane.showMessageDialog(null, "Se ha registrado exitosamente", "Información", JOptionPane.INFORMATION_MESSAGE);
			st.close();
			conex.desconectar();
		}catch(Exception e) {
			System.out.println(e.getMessage());
			//JOptionPane.showMessageDialog(null, "No se pudo registrar proveedor");
		}
		
	}

	public ArrayList<ProductoDTO> consultarProducto(int codProducto) {
		ArrayList<ProductoDTO> miProducto = new ArrayList<>();
		Conexion conex = new Conexion();
		try {
			PreparedStatement consulta = conex.getConnection().prepareStatement("SELECT * FROM productos WHERE codigo_producto = ?");
			consulta.setInt(1, codProducto);
			ResultSet res = consulta.executeQuery();
			
			if(res.next()){
				ProductoDTO producto = new ProductoDTO();
				producto.setCodigoProducto(res.getInt("codigo_producto"));
				producto.setIvaCompra(res.getDouble("iva_compra"));
				producto.setNitProveedor(res.getInt("nit_proveedor"));
				producto.setNombreProducto(res.getString("nombre_producto"));
				producto.setPrecioCompra(res.getDouble("precio_compra"));
				producto.setPrecioVenta(res.getDouble("precio_venta"));
				miProducto.add(producto); 
			}
			res.close(); 
			consulta.close();
			conex.desconectar(); 
		}catch(Exception e) {
			//JOptionPane.showMessageDialog(null, "No se pudeo consultar al proveedor" +e); 
			System.out.println(e.getMessage());
		} 
		return miProducto; 	

	}



	public void eliminarProducto(int codProducto) {
		Conexion conex = new Conexion();
		try { 
			String query = "DELETE FROM productos WHERE codigo_producto = ?"; 
			preparedStatement = conex.getConnection().prepareStatement(query);
			preparedStatement.setInt(1, codProducto);
			preparedStatement.executeUpdate();
		}catch(Exception e) {
			System.out.println(e.getMessage()); 
		} 
	}
		

	public void editarProducto(ProductoDTO producto) {
		Conexion conex = new Conexion();
        try {
            String query = "UPDATE productos set codigo_producto='"+producto.getCodigoProducto()+"', iva_compra='"+producto.getIvaCompra()+"',nit_proveedor='"+producto.getNitProveedor()+"',nombre_producto='"+producto.getNombreProducto()+"',precio_compra='"+producto.getPrecioCompra()+"',precio_venta='"+producto.getPrecioVenta()+"' WHERE codigo_producto ='"+producto.getCodigoProducto()+"'";
            preparedStatement = conex.getConnection().prepareStatement(query);
            preparedStatement.executeUpdate();
            
        }catch(Exception e) {
            System.out.println(e.getMessage());
        }
		
	}

}
