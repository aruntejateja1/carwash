package com.example.demo;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

public class VendorRegistration {
	@NotBlank(message="Id is mandatory")
	private String vendorId;
	
	
	@NotBlank(message="Name is mandatory")
	private String wcName;
	
	
	@NotBlank(message="type is mandatory")
	private String wcType;
	
	
	@NotBlank(message="start time is mandatory")
	private String wcStartTime;
	
	
	@NotBlank(message="end time is mandatory")
	private String wcEndTime;
	
	
	@NotBlank(message="contact details is mandatory")
	@Pattern(regexp="[0-9]{10}",message="must be 10 numbers")
	private String wcContact;
	
	
	@NotBlank(message="address is mandatory")
	private String wcAddress;
	
	
	public String getVendorId() {
		return vendorId;
	}
	public void setVendorId(String vendorId) {
		this.vendorId = vendorId;
	}
	public String getWcName() {
		return wcName;
	}
	public void setWcName(String wcName) {
		this.wcName = wcName;
	}
	public String getWcType() {
		return wcType;
	}
	public void setWcType(String wcType) {
		this.wcType = wcType;
	}
	public String getWcStartTime() {
		return wcStartTime;
	}
	public void setWcStartTime(String wcStartTime) {
		this.wcStartTime = wcStartTime;
	}
	public String getWcEndTime() {
		return wcEndTime;
	}
	public void setWcEndTime(String wcEndTime) {
		this.wcEndTime = wcEndTime;
	}
	public String getWcContact() {
		return wcContact;
	}
	public void setWcContact(String wcContact) {
		this.wcContact = wcContact;
	}
	public String getWcAddress() {
		return wcAddress;
	}
	public void setWcAddress(String wcAddress) {
		this.wcAddress = wcAddress;
	}
	
	
}
