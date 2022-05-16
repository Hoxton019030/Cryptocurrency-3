package com.Group1.CoinShell.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Group1.CoinShell.model.Cryptocurrency;
import com.Group1.CoinShell.model.CryptocurryencyDao;

@Controller
public class CryptocurrencyController {
	
	@Autowired
	private CryptocurryencyDao dao;
	
	@GetMapping("historical/get")
	@ResponseBody
	public Cryptocurrency findHistoricalCurrencyInformation(@RequestParam String currencyName ,@RequestParam String day) {
		Cryptocurrency historicalCryptocurrencyData = dao.findHistoricalCurrencyInformation(currencyName, day);
		return historicalCryptocurrencyData;
	}
	
	@GetMapping("historical/get2")
	@ResponseBody
	public Cryptocurrency findHistoricalCurrencyInformation2() {
		Cryptocurrency historicalCryptocurrencyData2 = dao.findHistoricalCurrencyInformation2();
		System.out.println("測試");
		System.out.println(historicalCryptocurrencyData2);
		return historicalCryptocurrencyData2;
	}
	
	@GetMapping("/individualCryptocurrencyInformation")
	public String getCryptocurrency(@RequestParam("currencyName") String name,@RequestParam("currentlyDay") String day, Model model) {
		Cryptocurrency lastestCurrencyInformation = dao.findLastestCurrencyInformation(name);
		dao.findHistoricalCurrencyInformation(name, day);
		model.addAttribute("currencyInformation", lastestCurrencyInformation);
		System.out.println(lastestCurrencyInformation);
		return "individualCryptocurrencyInformation";
	}

}
