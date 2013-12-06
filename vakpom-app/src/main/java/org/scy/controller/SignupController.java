package org.scy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login")
public class SignupController {

	@RequestMapping
	public String index(){
		return "login";
	}
}
