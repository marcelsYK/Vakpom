package org.scy.repository;

import java.util.List;

import org.scy.domain.Business;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface BusinessRepository extends MongoRepository<Business, String> {

	List<Business> findAllByBusinessName(String businessName);
	Business findByBusinessName(String businessName);
	Business findByCity(String city);
	List<Business> findAllByCountry(String country);
}
