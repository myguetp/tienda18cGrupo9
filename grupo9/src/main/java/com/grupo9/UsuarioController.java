package com.grupo9;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.grupo9.DAO.UsuarioDAO;
import com.grupo9.DTO.UsuarioDTO;

@RestController
public class UsuarioController {
	
	@RequestMapping("/registrarUsuario")
	public void registrarUsuario(UsuarioDTO usuario) {
		UsuarioDAO Dao = new UsuarioDAO();
		Dao.registrarUsuario(usuario);
	}
	
	@RequestMapping("/consultarUsuario")
	public ArrayList<UsuarioDTO> consultarUsuario(int documento){
		UsuarioDAO Dao = new UsuarioDAO();
		return Dao.consultarUsuario(documento);
	}
	
	@RequestMapping("/listarUsuarios")
	public ArrayList<UsuarioDTO> listaDeUsuarios(){
		UsuarioDAO Dao = new UsuarioDAO();
		return Dao.listaDeUsuarios();
	}
	
	@RequestMapping("/eliminarUsuario")
	public void eliminarUsuario(int cedula) {
		UsuarioDAO Dao = new UsuarioDAO();
		Dao.eliminarusuario(cedula);
	}
	
	@RequestMapping("/editarUsuario")
	public void editarUsuario(UsuarioDTO usuario){
		UsuarioDAO Dao = new UsuarioDAO();
		Dao.editarUsuario(usuario);
		
		
	}
}

