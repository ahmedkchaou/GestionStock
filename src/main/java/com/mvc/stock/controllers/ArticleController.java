package com.mvc.stock.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping(value = "/article")
public class ArticleController {

	@RequestMapping(value = "/")
	public String article() {
	
		return "article/article";
	}
}
