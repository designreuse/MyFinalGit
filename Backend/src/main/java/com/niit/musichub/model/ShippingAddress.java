package com.niit.musichub.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import org.hibernate.validator.constraints.NotEmpty;
@Entity
public class ShippingAddress implements Serializable{

	@Id
	@GeneratedValue( strategy = GenerationType.AUTO)
	private int shippingAddressId;
	
	@NotEmpty(message="House/Flat Number should not be Empty")
	private String house_no;
	
	@NotEmpty(message="Street Name/ Street Number should not be Empty")
	private String street_name;
	
	@NotEmpty(message="Society should not be Empty")
	private String society;
	
	@NotEmpty(message="City should not be Empty")
	private String city;
	
	@NotEmpty(message="State should not be Empty")
	private String state;
	
	@NotEmpty(message="Country should not be Empty")
	private String country;

	@NotEmpty(message="Zip Code should not be Empty")
	private String zip_code;
	
	@OneToOne
	private User user;

	public int getShippingAddressId() {
		return shippingAddressId;
	}

	public void setShippingAddressId(int shippingAddressId) {
		this.shippingAddressId = shippingAddressId;
	}

	public String getHouse_no() {
		return house_no;
	}

	public void setHouse_no(String house_no) {
		this.house_no = house_no;
	}

	public String getStreet_name() {
		return street_name;
	}

	public void setStreet_name(String street_name) {
		this.street_name = street_name;
	}

	public String getSociety() {
		return society;
	}

	public void setSociety(String society) {
		this.society = society;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getZip_code() {
		return zip_code;
	}

	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
}
