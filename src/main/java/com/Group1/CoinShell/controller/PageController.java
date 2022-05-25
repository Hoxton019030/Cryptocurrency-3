package com.Group1.CoinShell.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.Group1.CoinShell.service.Hoxton.CryptocurrencyInformationService;

@Controller

public class PageController {
	
	@Autowired
	CryptocurrencyInformationService service;
	
	@GetMapping(name="/")
	public String index() {
		return "index";
	}
	
	@GetMapping("/test")
	public String test() {
		return "/test";
	}
	
	@GetMapping("/viewAllAjax")
	public String forum() {
		return "forum/viewAllAjax";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * 請Yiwen將這個controller套入後台人員管理的連結
	 * @return
	 */
	@GetMapping("/administrator")
	public String administrator() {
		return "/backend/administrator";
	}


}
	

