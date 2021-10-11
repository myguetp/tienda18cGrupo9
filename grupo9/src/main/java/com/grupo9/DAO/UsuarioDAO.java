package com.grupo9.DAO;

import java.sql.*;
import java.util.ArrayList;

import com.grupo9.DTO.UsuarioDTO;



public class UsuarioDAO {
	PreparedStatement preparedStatement;
	
	public ArrayList<UsuarioDTO> listaDeUsuarios(){
		ArrayList<UsuarioDTO> miCliente = new ArrayList<UsuarioDTO>();
		Conexion conex = new Conexion();
		
		try {
			PreparedStatement consulta = conex.getConnection().prepareStatement("SELECT * FROM usuarios");
			ResultSet res = consulta.executeQuery();
			while(res.next()) {
				UsuarioDTO usuario = new UsuarioDTO();
				usuario.setCedulaUsuario(Integer.parseInt(res.getString("cedula_usuario")));
				usuario.setEmailUsuario(res.getString("email_usuario"));
				usuario.setNombreUsuario(res.getString("nombre_usuario"));
				usuario.setPassword(res.getString("password"));
				usuario.setUsuario(res.getString("usuario"));
				
				miCliente.add(usuario);
					}
					res.close();
					consulta.close();
					conex.desconectar();
		
			}
		catch(Exception e) {
			
			System.out.println(e.getMessage());
		}
		return miCliente;
		}
		
	public void registrarUsuario(UsuarioDTO usuario) {
		Conexion conex = new Conexion();
		try {
			Statement st = conex.getConnection().createStatement();
			st.executeUpdate("INSERT INTO usuarios VALUES ('"+usuario.getCedulaUsuario()+"', '"+usuario.getEmailUsuario()+"', '"+usuario.getNombreUsuario()+"', '"+usuario.getPassword()+"', '"+usuario.getUsuario()+"')");
			
			st.close();
			conex.desconectar();
		}catch(Exception e) {
			System.out.println(e.getMessage());
			
		}
	}
	
	public void editarUsuario(UsuarioDTO usuario) {
		Conexion conex= new Conexion();
		try {
			Statement st= conex.getConnection().createStatement();
			st.executeUpdate("UPDATE usuarios set cedula_usuario='"+usuario.getCedulaUsuario()+"', email_usuario='"+usuario.getEmailUsuario()+"',nombre_usuario='"+usuario.getNombreUsuario()+"',password='"+usuario.getPassword()+"',usuario='"+usuario.getUsuario()+"' WHERE cedula_usuario ="+usuario.getCedulaUsuario());
			
			System.out.println("Se actualizo correctamente el usuario");
			
			st.close();
			conex.desconectar();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			
			System.out.println("No se actualizo el usuario");
		}
	}
	
	public ArrayList<UsuarioDTO> consultarUsuario(int cedulaUsuario){
		ArrayList<UsuarioDTO> miUsuario = new ArrayList<UsuarioDTO>();
		Conexion conex = new Conexion();
		try {
			PreparedStatement consulta = conex.getConnection().prepareStatement("SELECT * FROM usuarios WHERE cedula_usuario = ?");
			consulta.setInt(1, cedulaUsuario);
			ResultSet res = consulta.executeQuery();
			
			if(res.next()){
				UsuarioDTO usuario = new UsuarioDTO();
				usuario.setCedulaUsuario(Integer.parseInt(res.getString("cedula_usuario")));
				usuario.setEmailUsuario(res.getString("email_usuario"));
				usuario.setNombreUsuario(res.getString("nombre_usuario"));
				usuario.setPassword(res.getString("password"));
				usuario.setUsuario(res.getString("usuario"));
				miUsuario.add(usuario); 
			}
			res.close(); 
			consulta.close();
			conex.desconectar(); 
		}catch(Exception e) {
			
			System.out.println(e.getMessage());
		} 
		return miUsuario; 	
	}
		
	public void eliminarusuario(int cedula) { 
		Conexion conex = new Conexion();
		try { 
			String query = "DELETE FROM usuarios WHERE cedula_usuario = ?"; 
			preparedStatement = conex.getConnection().prepareStatement(query);
			preparedStatement.setInt(1, cedula);
			preparedStatement.executeUpdate();
		}catch(Exception e) {
			System.out.println(e.getMessage()); 
		} 
	}
	/*public void editarUsuario(UsuarioDTO usuario) {
        Conexion conex = new Conexion();
        try {
            String query = "UPDATE usuarios set cedula_usuario='"+usuario.getCedulaUsuario()+"', email_usuario='"+usuario.getEmailUsuario()+"',nombre_usuario='"+usuario.getNombreUsuario()+"',password='"+usuario.getPassword()+"',usuario='"+usuario.getUsuario()+"' WHERE cedula_usuario ='"+usuario.getCedulaUsuario()+"'";
            preparedStatement = conex.getConnection().prepareStatement(query);
            preparedStatement.executeUpdate();
            
        }catch(Exception e) {
            System.out.println(e.getMessage());
        }
    }*/	
		
}
