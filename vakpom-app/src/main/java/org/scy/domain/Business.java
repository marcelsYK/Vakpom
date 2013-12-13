package org.scy.domain;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class Business {

	@Id
	private String id;
	
	private String businessName;
	private String type;
	private String description;
	private String phone;
	private String imageUrl;
	private String streetAddress;
	private String zipCode;
	private String city;
	private String country;
	private long totalRating = 5;
	private long timesRated = 1;
	private long finalRating = totalRating/timesRated;
	

	public Business(String id, String businessName, String type, String description,
			String phone, String imageUrl, String streetAddress,
			String zipCode, String city, String country, long totalRating,
			long timesRated) {
		super();
		this.id = id;
		this.businessName = businessName;
		this.type = type;
		this.description = description;
		this.phone = phone;
		this.imageUrl = imageUrl;
		this.streetAddress = streetAddress;
		this.zipCode = zipCode;
		this.city = city;
		this.country = country;
		this.totalRating = totalRating;
		this.timesRated = timesRated;
		this.finalRating = this.totalRating/this.timesRated;
	}

	public Business(String id, String businessName, String type, String description,
			String phone, String imageUrl, String streetAddress,
			String zipCode, String city, String country) {
		super();
		this.id = id;
		this.businessName = businessName;
		this.type = type;
		this.description = description;
		this.phone = phone;
		this.imageUrl = imageUrl;
		this.streetAddress = streetAddress;
		this.zipCode = zipCode;
		this.city = city;
		this.country = country;
	}
	public Business() {
	}

	public long getTotalRating() {
		System.out.println("Oa");
		return totalRating;
		
	}

	public void setTotalRating(long totalRating) {
		this.totalRating = totalRating;
	}

	public long getTimesRated() {
		return timesRated;
	}

	public void setTimesRated(long timesRated) {
		this.timesRated = timesRated;
	}

	public long getFinalRating() {
		return finalRating;
	}

	public void setFinalRating(long finalRating) {
		this.finalRating = finalRating;
	}

	public String getStreetAddress() {
		return streetAddress;
	}

	public void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBusinessName() {
		return businessName;
	}

	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	/**
	 * toString method for Business
	 *
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
	    final StringBuilder sb = new StringBuilder();
	
	 sb.append("Id :  " + this.id == null ? "" :  this.id  + ",");
	 sb.append("Business Name :  " + this.businessName == null ? "" :  this.businessName  + ",");
	 sb.append("Type :  " + this.type == null ? "" :  this.type  + ",");
	 sb.append("Description :  " + this.description == null ? "" :  this.description  + ",");
	 sb.append("Phone :  " + this.phone == null ? "" :  this.phone  + ",");
	 sb.append("Image Url :  " + this.imageUrl == null ? "" :  this.imageUrl  + ",");
	 sb.append("Street Address :  " + this.streetAddress == null ? "" :  this.streetAddress  + ",");
	 sb.append("Zip Code :  " + this.zipCode == null ? "" :  this.zipCode  + ",");
	 sb.append("City :  " + this.city == null ? "" :  this.city  + ",");
	 sb.append("Country :  " + this.country == null ? "" :  this.country  + ",");
	 sb.append("Total Rating :  " + this.totalRating + ",");
	 sb.append("Times Rated :  " + this.timesRated + ",");
	 sb.append("Final Rating :  " + this.finalRating + ","); 
	 return "Business [" + sb.toString() + "]";
	}

	
}
