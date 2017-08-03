package com.sample.hibernate.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="employees")
public class Employees {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public int id;
	
	@Column
	public String lastname;
	
	@Column
	public String firstname;
	
	@Column
	public String email;
	
	@Column
	public int mobile;
	
public Employees() {

}

public Employees(int id,String lastname,String firstname,String email,int mobile) {
	this.id=id;
	this.firstname=firstname;
	this.lastname=lastname;
	this.email=email;
	this.mobile=mobile;
}

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public String getLastname() {
	return lastname;
}

public void setLastname(String lastname) {
	this.lastname = lastname;
}

public String getFirstname() {
	return firstname;
}

public void setFirstname(String firstname) {
	this.firstname = firstname;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public int getMobile() {
	return mobile;
}

public void setMobile(int mobile) {
	this.mobile = mobile;
}

}