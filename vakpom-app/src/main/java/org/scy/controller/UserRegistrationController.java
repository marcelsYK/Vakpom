package org.scy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserRegistrationController {

	@RequestMapping("/login")
	public String getLoginPage(){
		return "login";
	}
	
	@RequestMapping("/create_account")
	public String getSignupPage(){
		System.out.println("Registrationc controller test");
		return "create_account";
	}
}
