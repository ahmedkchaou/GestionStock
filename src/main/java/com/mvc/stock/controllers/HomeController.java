package com.mvc.stock.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping(value = "/home")
public class HomeController {

	//private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	@RequestMapping(value = "/")
	public String home() {
			
		return "home/home";
	}
	
	@RequestMapping(value = "/blank")
	public String blankHome() {
			
		return "blank/blank";
	}
}
