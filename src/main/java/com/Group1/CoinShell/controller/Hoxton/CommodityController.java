package com.Group1.CoinShell.controller.Hoxton;

import java.io.IOException;
import java.util.Base64;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.Group1.CoinShell.model.Hoxton.Commodity;
import com.Group1.CoinShell.model.Hoxton.CommodityDao;
import com.Group1.CoinShell.service.Hoxton.CommodityService;

@Controller
public class CommodityController {
	
	@Autowired
	private CommodityService service;
	@Autowired
	private CommodityDao dao;
	
	//返回首頁
	@PostMapping("administrator/store/commodityUpload")
	public String addNewCommodity(
			@RequestParam("name")String name,
			@RequestParam("discribe")String discribe,
			@RequestParam("volume") Integer volume,
			@RequestParam("photo")MultipartFile file,
			@RequestParam("shellOrCoin")String shellOrCoin,
			@RequestParam("myShell") Integer myShell,
			@RequestParam("coin")Integer coin) {
		Commodity commodity = new Commodity();
		commodity.setCommodityName(name);
		commodity.setDiscribe(discribe);
		commodity.setVolume(volume);
		try {
			byte[] bytes = file.getBytes();
			String encodeToString = bytes.toString();
//			String encodeToString = Base64.getEncoder().encodeToString(bytes);
			commodity.setPhoto(bytes);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		commodity.setShellOrCoin(shellOrCoin);
		commodity.setMyShell(myShell);
		commodity.setCoin(coin);
		dao.save(commodity);
	
	return "backend/store/administrator-store";	
	}
	

}
