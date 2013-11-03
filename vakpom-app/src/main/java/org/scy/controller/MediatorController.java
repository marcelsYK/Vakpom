package org.scy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class MediatorController {

	/*@RequestMapping
	public String getHomePage() {
		System.out.println();
		return "redirect:/users";
	}
	
	@RequestMapping
	public String getHomepage() {
		System.out.println("Inside media");
		return "redirect:/businesses";
	}*/
	
	//@RequestMapping(value = "index", method = RequestMethod.GET)
	@RequestMapping
	public String index(){
		return "index";
	}
}
