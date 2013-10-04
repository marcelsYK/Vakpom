package org.scy.dto;

import java.util.List;

import org.scy.domain.Business;

public class BusinessListDto {

	private List<Business> businesses;
	
	public List<Business> getBusinesses() {
		return businesses;
	}

	public void setUsers(List<Business> businesses) {
		this.businesses = businesses;
		System.out.println("Oa");
	}
}
