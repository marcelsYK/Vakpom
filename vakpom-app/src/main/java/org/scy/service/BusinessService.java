package org.scy.service;

import java.util.List;
import java.util.UUID;

import org.scy.domain.Business;
import org.scy.repository.BusinessRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class BusinessService {

	// TODO Think of using an abstractFactory
	@Autowired
	BusinessRepository businessRepository;
	
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
		System.out.println("found you" + existingBusiness.getBusinessName() );
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
	
	
	public List<Business> findAllByBusinessName(String businessName)
	{
		if (businessName==null || businessName.trim()=="")
		
			return businessRepository.findAll();
		
		
		return businessRepository.findAllByBusinessName(businessName);
	}
}
