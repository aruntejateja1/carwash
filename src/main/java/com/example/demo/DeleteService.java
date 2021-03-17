package com.example.demo;

import javax.validation.constraints.NotBlank;

public class DeleteService {

	@NotBlank(message="Id is mandatory")
	private String vendorId;
	
	public String getVendorId() {
		return vendorId;
	}

	public void setVendorId(String vendorId) {
		this.vendorId = vendorId;
	}

	@NotBlank(message="Name is mandatory")
	private String wcName;

	public String getWcName() {
		return wcName;
	}

	public void setWcName(String wcName) {
		this.wcName = wcName;
	}
	
	
}
