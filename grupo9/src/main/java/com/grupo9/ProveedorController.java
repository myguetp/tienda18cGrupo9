package com.grupo9;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.grupo9.DAO.ProveedorDAO;
import com.grupo9.DTO.ProveedorDTO;


@RestController
public class ProveedorController {
	
	@RequestMapping("/registarProveedor")
	public void registrar(ProveedorDTO proveedor) {
		ProveedorDAO Dao = new ProveedorDAO();
		Dao.registarProveedor(proveedor);
	}
	
	@RequestMapping("/consultarProveedor")
	public ArrayList<ProveedorDTO> consultar(int nit){
		ProveedorDAO Dao = new ProveedorDAO();
		return Dao.consultarProveedor(nit);
	}
	
	@RequestMapping("/listaDeProveedores")
	public ArrayList<ProveedorDTO> listar(){
		ProveedorDAO Dao = new ProveedorDAO();
		return Dao.listaDeProveedores();
	}
	
	@RequestMapping("/eliminarProveedor")
	public void eliminar(int nit) {
		ProveedorDAO Dao = new ProveedorDAO();
		Dao.eliminarProveedor(nit);
	}


}
