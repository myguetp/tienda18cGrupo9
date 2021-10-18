package com.grupo9;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.grupo9.DAO.VentaDAO;
import com.grupo9.DTO.VentaDTO;

@RestController
public class VentaController {
	
	@RequestMapping("/registrarVenta")
	public void registrarVenta(VentaDTO venta) {
		VentaDAO Dao = new VentaDAO();
		Dao.registrarVenta(venta);
	}
	
	@RequestMapping("/consultarVenta")
	public ArrayList<VentaDTO> consultarVenta(int venta){
		VentaDAO Dao = new VentaDAO();
		return Dao.consultarVenta(venta);
	}
	
	@RequestMapping("/listaDeVenta")
	public ArrayList<VentaDTO> listaDeVenta(){
		VentaDAO Dao = new VentaDAO();
		return Dao.listaDeVenta();
	}
	
	@RequestMapping("/eliminarVenta")
	public void eliminarVenta(int venta) {
		VentaDAO Dao = new VentaDAO();
		Dao.eliminarVenta(venta);
	}
	
	@RequestMapping("/editarVenta")
	public void editarVenta(VentaDTO venta){
		VentaDAO Dao = new VentaDAO();
		Dao.editarVenta(venta);
		
		
	}
	@RequestMapping("/listaDeVenta2")
	public void listaDeVenta2(VentaDTO venta) {
		VentaDAO Dao = new VentaDAO();
		Dao.listaDeVenta2();
	}

}
