package org.scy.domain;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class User {

	@Id
	private String id;

	private String firstName;
	private String lastName;

	private String username;
	private String password;
	private String email;
	private String city;
	private int zipcode;
	private String country;
	
	@DBRef
	private Role role;


	public User() {
	}

	private User(Builder builder) {
		this.id = builder.id;
		this.firstName = builder.firstName;
		this.lastName = builder.lastName;
		this.username = builder.username;
		this.password = builder.password;
		this.role = builder.role;
		this.zipcode = builder.zipcode;
		this.country= builder.country;
	}

	public static class Builder {

		public String country;

		public int zipcode;

		private String id;

		private String firstName;
		private String lastName;

		private String username;
		private String password;

		private Role role;

		public Builder() {

		}

		public Builder withFirstName(String firstName) {
			this.firstName = firstName;
			return this;
		}
		
		public Builder withRole(Role role) {
			this.role = role;
			return this;
		}
		
		public Builder withUsername(String username) {
			this.username = username;
			return this;
		}
		
		public Builder withPassword(String password) {
			this.password = password;
			return this;
		}
		
		public Builder withZipcode(int zipcode) {
			this.zipcode = zipcode;
			return this;
		}
		
		public Builder withCountry(String country) {
			this.country = country;
			return this;
		}

		public Builder withLastName(String lastName) {
			this.lastName = lastName;
			return this;
		}

		public User build() {
			return new User(this);
		}

	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}
	

	public int getZipcode() {
		return zipcode;
	}

	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * toString method for User
	 *
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
	    final StringBuilder sb = new StringBuilder();
	
	 sb.append("Id :  " + this.id == null ? "" :  this.id  + ",");
	 sb.append("First Name :  " + this.firstName == null ? "" :  this.firstName  + ",");
	 sb.append("Last Name :  " + this.lastName == null ? "" :  this.lastName  + ",");
	 sb.append("Username :  " + this.username == null ? "" :  this.username  + ",");
	 sb.append("Password :  " + this.password == null ? "" :  this.password  + ",");
	 sb.append("Email :  " + this.email == null ? "" :  this.email  + ",");
	 sb.append("City :  " + this.city == null ? "" :  this.city  + ",");
	 sb.append("Zipcode :  " + this.zipcode + ",");
	 sb.append("Country :  " + this.country == null ? "" :  this.country  + ",");
	 sb.append("Role :  " + this.role == null ? "" :  this.role  + ","); 
	 return "User [" + sb.toString() + "]";
	}	
	
	

}
