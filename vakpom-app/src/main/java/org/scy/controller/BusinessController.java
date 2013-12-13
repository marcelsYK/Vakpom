package org.scy.controller;

import java.util.List;

import org.scy.domain.Business;
import org.scy.dto.BusinessListDto;
import org.scy.service.BusinessService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/businesses")
public class BusinessController {

	Logger logger = LoggerFactory.getLogger(BusinessController.class);
	
	@Autowired
	private BusinessService businessService;

	@RequestMapping
	public String getBusinessesPage() {
	
		return "businesses";
	}
	
	 @RequestMapping(value = "/get", method = RequestMethod.GET)
	   public ModelAndView student(@RequestBody String businessName) {
		 List <Business> businesses = businessService.findAllByBusinessName(businessName);
		 
		 return new ModelAndView("businesses", "business", businesses.get(0));
	   }
	 

	@RequestMapping(value = "/records")
	public @ResponseBody
	BusinessListDto getBusinesses() {
		BusinessListDto businessListDto = new BusinessListDto();
		businessListDto.setBusinesses(businessService.readAll());
		return businessListDto;
	}

	@RequestMapping(value = "/get")
	public @ResponseBody
	Business get(@RequestBody String businessName) {
	List <Business> businesses = businessService.findAllByBusinessName(businessName);
		
		System.out.println("Inside Business");
		return businessService.read( businesses.get(0));
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public @ResponseBody
	Business create(@RequestParam String id, @RequestParam String businessName,
			@RequestParam String description,
			@RequestParam String type,
			@RequestParam String phone,
			@RequestParam String city,
			@RequestParam String country,
			@RequestParam String streetAddress,
			@RequestParam String imageUrl
			) {
		Business existingBusiness = new Business();
		existingBusiness.setId(id);
		existingBusiness.setBusinessName(businessName);
		existingBusiness.setDescription(description);
		existingBusiness.setType(type);
		existingBusiness.setCity(city);
		existingBusiness.setPhone(phone);
		existingBusiness.setCountry(country);
		existingBusiness.setStreetAddress(streetAddress);
		existingBusiness.setImageUrl(imageUrl);

		return businessService.create(existingBusiness);
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public @ResponseBody
	Business update(@RequestParam String id, @RequestParam String businessName,
			@RequestParam String type, @RequestParam String description,
			@RequestParam String phone, @RequestParam String imageUrl,
			@RequestParam String streetAddress, @RequestParam String zipCode,
			@RequestParam String city, @RequestParam String country) {

		Business existingBusiness = new Business(id, businessName, type,
				description, phone, imageUrl, streetAddress, zipCode, city,
				country);

		return businessService.update(existingBusiness);
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public @ResponseBody
	Boolean delete(@RequestParam String businessName) {

		Business existingBusiness = new Business();
		existingBusiness.setBusinessName(businessName);

		return businessService.delete(existingBusiness);
	}
}
