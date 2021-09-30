package com.grupo9.DAO;
import java.sql.*;


public class ClientesDAO {
	PreparedStatement preparedStatement;
	
	
	
	
	
	public void eliminarcliente(int cedula) {
        Conexion conex = new Conexion();
        try {
            String query = "DELETE FROM clientes WHERE cedula_cliente = ?";
            preparedStatement = conex.getConnection().prepareStatement(query);
            preparedStatement.setInt(1, cedula);
            preparedStatement.executeUpdate();
            
        }catch(Exception e) {
            System.out.println(e.getMessage());
        }
    }
	
	
	
	public void actualizarcliente(int cedula) {
		Conexion conex = new Conexion();
		try {
			String query = "update CLIENTES set  direccion_cliente=?, email_cliente=?, nombre_cliente=?, telefono_cliente=? where cedula_cliente=?";
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}

}
