package org.scy.service;

import java.util.List;
import java.util.UUID;

import org.scy.domain.Business;
import org.scy.repository.BusinessRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BusinessService {

	// TODO Think of using an abstractFactory
	@Autowired
	private BusinessRepository businessRepository;
	

	public Business create(Business business) {
		business.setId(UUID.randomUUID().toString());
		
		return businessRepository.save(business);
	}
	
	public Business read(Business business) {
		return business;
	}
	
	public List<Business> readAll() {
		return businessRepository.findAll();
	}
	
	public Business update(Business business) {
		Business existingBusiness = businessRepository.findByBusinessName(business.getBusinessName());
		
		if (existingBusiness == null) {
			return null;
		}
		
		return businessRepository.save(existingBusiness);
	}
	
	public Boolean delete(Business business) {
		Business existingUser = businessRepository.findByBusinessName(business.getBusinessName());
		
		if (existingUser == null) {
			return false;
		}
		businessRepository.delete(existingUser);
		return true;
	}
	
}
