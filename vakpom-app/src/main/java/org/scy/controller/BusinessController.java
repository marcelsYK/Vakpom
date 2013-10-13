package org.scy.controller;

import org.scy.domain.Business;
import org.scy.dto.BusinessListDto;
import org.scy.service.BusinessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/business")
public class BusinessController {

	@Autowired
	private BusinessService businessService;

	@RequestMapping
	public String getBusinessPage() {
		return "business";
	}

	@RequestMapping(value = "/bussinessRecords")
	public @ResponseBody
	BusinessListDto getBusinesses() {
		BusinessListDto businessListDto = new BusinessListDto();
		businessListDto.setBusinesses(businessService.readAll());
		return businessListDto;
	}

	@RequestMapping(value = "/get")
	public @ResponseBody
	Business get(@RequestBody Business business) {
		return businessService.read(business);
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public @ResponseBody
	Business create(@RequestParam String id, @RequestParam String businessName,
			@RequestParam String type, @RequestParam String description,
			@RequestParam String phone, @RequestParam String imageUrl,
			@RequestParam String streetAddress, @RequestParam String zipCode,
			@RequestParam String city, @RequestParam String country) {

		Business existingBusiness = new Business(id, businessName, type,
				description, phone, imageUrl, streetAddress, zipCode, city,
				country);

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
