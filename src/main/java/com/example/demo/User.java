package com.example.demo;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

public class User {
	
	@NotBlank(message="Name is mandatory")
	@Pattern(regexp="[a-z A-z]{4,50}",message="First Name must be 4 to 50 characters")
private String firstName;

	@NotBlank(message="Name is mandatory")
	@Pattern(regexp="[a-z A-z]{4,50}",message="Last Name must be 4 to 50 characters")
private String lastName;

	@NotBlank(message="Number is mandatory")
	@Pattern(regexp="[0-9]{10}",message="Contact Number must be 10 numbers")
private String contactNumber;

	@NotBlank(message="Email is mandatory")
	@Pattern(regexp="[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,}$",message="Email must be in format characters@characters.domain")
private String email;

	@NotBlank(message="Password is mandatory")
	@Pattern(regexp="(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%*^]).{6,}",message="Password must contain more than 6 letters with atleast one number,one lowercase and one uppercase and one special character")
private String password;
	
	//@NotBlank(message="userType is mandatory")
	private String userType;
	private String vid;
	
public String getVid() {
		return vid;
	}

	public void setVid(String vid) {
		this.vid = vid;
	}

public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

public String getFirstName() {
	return firstName;
}

public void setFirstName(String firstName) {
	this.firstName = firstName;
}
public String getLastName() {
	return lastName;
}
public void setLastName(String lastName) {
	this.lastName = lastName;
}
public String getContactNumber() {
	return contactNumber;
}
public void setContactNumber(String contactNumber) {
	this.contactNumber = contactNumber;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}

}
