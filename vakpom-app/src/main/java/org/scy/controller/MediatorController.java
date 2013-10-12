package org.scy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class MediatorController {

	@RequestMapping
	public String getHomePage() {
		System.out.println();
		return "redirect:/users";
	}
	
	@RequestMapping
	public String getBusinesses() {
		return "redirect:/bussinesses";
	}
}
