package com.Group1.CoinShell.controller.Hoxton;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.Group1.CoinShell.model.Hoxton.Commodity;
import com.Group1.CoinShell.service.Hoxton.CommodityService;

@RestController
public class CommodityControllerApi {

	@Autowired
	private CommodityService service;
	
	@GetMapping("/allCommodity")
	public  List<Commodity> findAllCommodity(){
		List<Commodity> findAllCommodity = service.findAllCommodity();
		return findAllCommodity;
	}
	//http://localhost:8080/coinshell/allCommodity
	
	@GetMapping("/Commodity")
    public List<Commodity> findCommodityByName(@RequestParam("name")String name){
		List<Commodity> commodityLIst = service.findCommodityByName(name);
		return commodityLIst;
	}
}
