package com.grupo9.DAO;
import java.sql.*;
import java.util.ArrayList;

//import javax.swing.JOptionPane;

import com.grupo9.DTO.ClienteDTO;


public class ClienteDAO {
	PreparedStatement preparedStatement;
	
		public ArrayList <ClienteDTO> listaDeClientes(){
			ArrayList <ClienteDTO> miCliente=new ArrayList<ClienteDTO>();
			Conexion conex=new Conexion();

		
		try {
			PreparedStatement consulta=conex.getConnection().prepareStatement("SELECT * FROM clientes");
			ResultSet res = consulta.executeQuery();
			while(res.next()) {
				ClienteDTO cliente =new ClienteDTO();
				cliente.setCedulaCliente(Integer.parseInt(res.getString("cedula_cliente")));
				cliente.setDireccionCliente(res.getString("direccion_cliente"));
				cliente.setEmailCliente(res.getString("email_cliente"));
				cliente.setNombreCliente(res.getString("nombre_cliente"));
				cliente.setTelefonoCliente(res.getString("telefono_cliente"));
				
				miCliente.add(cliente);
				}
				res.close();
				consulta.close();
				conex.desconectar();
		}catch(Exception e) {
			System.out.println("no se puede realizar la consulta"+e);
			//JOptionPane.showMessageDialog(null, "No se puede realizar la consulta" + e);
		}
		return miCliente;
		}
		

	public void registrarCliente(ClienteDTO cliente) {
		Conexion conex = new Conexion();
		try {
			Statement st = conex.getConnection().createStatement();
			st.executeUpdate("INSERT INTO clientes VALUES ('"+cliente.getCedulaCliente()+"', '"+cliente.getDireccionCliente()+"', '"+cliente.getEmailCliente()+"', '"+cliente.getNombreCliente()+"', '"+cliente.getTelefonoCliente()+"')");
			
			st.close();
			conex.desconectar();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		
		}
	}
	
	public ArrayList <ClienteDTO> consultarCliente(int cedulaCliente){
		ArrayList <ClienteDTO> miCliente=new ArrayList <ClienteDTO>();
		Conexion conex=new Conexion();
		try {
			PreparedStatement consulta = conex.getConnection().prepareStatement("SELECT * FROM clientes WHERE cedula_cliente = ?");
			consulta.setInt(1, cedulaCliente);
			ResultSet res = consulta.executeQuery();
			if(res.next()) {
				ClienteDTO cliente=new ClienteDTO();
				cliente.setCedulaCliente(Integer.parseInt(res.getString("cedula_cliente")));
				cliente.setDireccionCliente(res.getString("direccion_cliente"));
				cliente.setEmailCliente(res.getString("email_cliente"));
				cliente.setNombreCliente(res.getString("nombre_cliente"));
				cliente.setTelefonoCliente(res.getString("telefono_cliente"));
				
				miCliente.add(cliente);
			}
			res.close();
			consulta.close();
			conex.desconectar();
		}catch(Exception e) {
			
			System.out.println(e.getMessage());
		}
		return miCliente;
	}
	
	
	public void eliminarCliente(int cedula) {
		Conexion conex = new Conexion();
		try {
			String query="DELETE FROM clientes WHERE cedula_cliente = ?";
			preparedStatement = conex.getConnection().prepareStatement(query);
			preparedStatement.setInt(1, cedula);
			preparedStatement.executeUpdate();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}


     public void editarCliente(ClienteDTO cliente) {
         Conexion conex = new Conexion();
         try {
         	Statement st = conex.getConnection().createStatement();
         	st.executeUpdate("UPDATE clientes set direccion_cliente = '"+cliente.getDireccionCliente()+"',email_cliente ='"+cliente.getEmailCliente()+"',nombre_cliente ='"+cliente.getNombreCliente()+"',telefono_cliente='"+cliente.getTelefonoCliente()+"' WHERE cedula_cliente =" +cliente.getCedulaCliente());
        	
			st.close();
			conex.desconectar();
			
         }catch(Exception e) {
             System.out.println(e.getMessage());
             System.out.println("No se actualizo el cliente");
         }
     }	
     
     


}
