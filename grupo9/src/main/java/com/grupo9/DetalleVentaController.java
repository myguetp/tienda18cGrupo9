package com.grupo9;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.grupo9.DAO.DetalleVentaDAO;
import com.grupo9.DAO.VentaDAO;
import com.grupo9.DTO.DetalleVentaDTO;
import com.grupo9.DTO.VentaDTO;

@RestController
public class DetalleVentaController {
	
	@RequestMapping("/registrarDetalleVenta")
	public void registrarDetalleVenta(DetalleVentaDTO detalleVenta) {
		DetalleVentaDAO Dao = new DetalleVentaDAO();
		Dao.registrarDetalleVenta(detalleVenta);
	}
	
	@RequestMapping("/consultarDetalleVenta")
	public ArrayList<DetalleVentaDTO> consultarDetalleVenta(int detalleVenta){
		DetalleVentaDAO Dao = new DetalleVentaDAO();
		return Dao.consultarDetalleVenta(detalleVenta);
	}
	
	@RequestMapping("/listaDeDetalleVenta")
	public ArrayList<DetalleVentaDTO> listaDetalleVenta(){
		DetalleVentaDAO Dao = new DetalleVentaDAO();
		return Dao.listaDetalleVenta();
	}
	
	@RequestMapping("/eliminarDetalleVenta")
	public void eliminarDetalleVenta(int detalleVenta) {
		DetalleVentaDAO Dao = new DetalleVentaDAO();
		Dao.eliminarDetalleVenta(detalleVenta);
	}
	
	@RequestMapping("/editarDetalleVenta")
	public void editarDetalleVenta(DetalleVentaDTO detalleVenta){
		DetalleVentaDAO Dao = new DetalleVentaDAO();
		Dao.editarDetalleVenta(detalleVenta);
	}
	
	

}