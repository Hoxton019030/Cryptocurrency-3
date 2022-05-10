package com.Group1.CoinShell.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PageController {
	
	@GetMapping(name="/")
	public String index() {
		return "index";
	}
	
	@GetMapping("/test")
	public String test() {
		return "/test";
	}
	
	@GetMapping("/individualCryptocurrencyInformation")
	public String getCryptocurrency(@RequestParam("currencyName") String name,Model model) {
		
		return "individualCryptocurrencyInformation";
	}
	

}
