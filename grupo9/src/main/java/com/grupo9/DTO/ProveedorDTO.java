package com.grupo9.DTO;

import java.util.Objects;

public class ProveedorDTO {
	private int nitProveedor;
	private String ciudadProveedor;
	private String direccionProveedor;
	private String nombreProveedor;
	private String telefonoProveedor;
	public ProveedorDTO(int nitProveedor, String ciudadProveedor, String direccionProveedor, String nombreProveedor,
			String telefonoProveedor) {

		this.nitProveedor = nitProveedor;
		this.ciudadProveedor = ciudadProveedor;
		this.direccionProveedor = direccionProveedor;
		this.nombreProveedor = nombreProveedor;
		this.telefonoProveedor = telefonoProveedor;
	}
	
	public ProveedorDTO() {
	}

	public int getNitProveedor() {
		return nitProveedor;
	}

	public void setNitProveedor(int nitProveedor) {
		this.nitProveedor = nitProveedor;
	}

	public String getCiudadProveedor() {
		return ciudadProveedor;
	}

	public void setCiudadProveedor(String ciudadProveedor) {
		this.ciudadProveedor = ciudadProveedor;
	}

	public String getDireccionProveedor() {
		return direccionProveedor;
	}

	public void setDireccionProveedor(String direccionProveedor) {
		this.direccionProveedor = direccionProveedor;
	}

	public String getNombreProveedor() {
		return nombreProveedor;
	}

	public void setNombreProveedor(String nombreProveedor) {
		this.nombreProveedor = nombreProveedor;
	}

	public String getTelefonoProveedor() {
		return telefonoProveedor;
	}

	public void setTelefonoProveedor(String telefonoProveedor) {
		this.telefonoProveedor = telefonoProveedor;
	}

	@Override
	public int hashCode() {
		return Objects.hash(ciudadProveedor, direccionProveedor, nitProveedor, nombreProveedor, telefonoProveedor);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ProveedorDTO other = (ProveedorDTO) obj;
		return Objects.equals(ciudadProveedor, other.ciudadProveedor)
				&& Objects.equals(direccionProveedor, other.direccionProveedor) && nitProveedor == other.nitProveedor
				&& Objects.equals(nombreProveedor, other.nombreProveedor)
				&& Objects.equals(telefonoProveedor, other.telefonoProveedor);
	}

	@Override
	public String toString() {
		return "ProveedoresDTO [nitProveedor=" + nitProveedor + ", ciudadProveedor=" + ciudadProveedor
				+ ", direccionProveedor=" + direccionProveedor + ", nombreProveedor=" + nombreProveedor
				+ ", telefonoProveedor=" + telefonoProveedor + "]";
	}
	
	

}
