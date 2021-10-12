package com.grupo9.DTO;

import java.util.Objects;

public class VentaDTO {
	
	private Integer codigo_venta;
	private Integer cedula_cliente;
	private Integer cedula_usuario;
	private Double iva_venta;
	private Double total_venta;
	private Double valor_venta;
	
	
	
	public VentaDTO() {
	}
	
	public Integer getCodigo_venta() {
		return codigo_venta;
	}
	public void setCodigo_venta(Integer codigo_venta) {
		this.codigo_venta = codigo_venta;
	}
	public Integer getCedula_cliente() {
		return cedula_cliente;
	}
	public void setCedula_cliente(Integer cedula_cliente) {
		this.cedula_cliente = cedula_cliente;
	}
	public Integer getCedula_usuario() {
		return cedula_usuario;
	}
	public void setCedula_usuario(Integer cedula_usuario) {
		this.cedula_usuario = cedula_usuario;
	}
	public Double getIva_venta() {
		return iva_venta;
	}
	public void setIva_venta(Double iva_venta) {
		this.iva_venta = iva_venta;
	}
	public Double getTotal_venta() {
		return total_venta;
	}
	public void setTotal_venta(Double total_venta) {
		this.total_venta = total_venta;
	}
	public Double getValor_venta() {
		return valor_venta;
	}
	public void setValor_venta(Double valor_venta) {
		this.valor_venta = valor_venta;
	}
	@Override
	public int hashCode() {
		return Objects.hash(cedula_cliente, cedula_usuario, codigo_venta, iva_venta, total_venta, valor_venta);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		VentaDTO other = (VentaDTO) obj;
		return Objects.equals(cedula_cliente, other.cedula_cliente)
				&& Objects.equals(cedula_usuario, other.cedula_usuario)
				&& Objects.equals(codigo_venta, other.codigo_venta) && Objects.equals(iva_venta, other.iva_venta)
				&& Objects.equals(total_venta, other.total_venta) && Objects.equals(valor_venta, other.valor_venta);
	}
	@Override
	public String toString() {
		return "VentaDTO [codigo_venta=" + codigo_venta + ", cedula_cliente=" + cedula_cliente + ", cedula_usuario="
				+ cedula_usuario + ", iva_venta=" + iva_venta + ", total_venta=" + total_venta + ", valor_venta="
				+ valor_venta + "]";
	}
	public VentaDTO(Integer codigo_venta, Integer cedula_cliente, Integer cedula_usuario, Double iva_venta,
			Double total_venta, Double valor_venta) {
		
		this.codigo_venta = codigo_venta;
		this.cedula_cliente = cedula_cliente;
		this.cedula_usuario = cedula_usuario;
		this.iva_venta = iva_venta;
		this.total_venta = total_venta;
		this.valor_venta = valor_venta;
	}
	
	

}
