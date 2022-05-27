package com.Group1.CoinShell.service.Hoxton;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.Group1.CoinShell.model.Hoxton.Commodity;
import com.Group1.CoinShell.model.Hoxton.CommodityDao;

@Service
@Transactional
public class CommodityService {

	@Autowired
	private CommodityDao dao;

	public void insertcommodity(String commodityName,String discribe,String photo,Integer price,Integer volume,Integer myShell,String shellOrCoin) {
		dao.insertcommodity(commodityName, discribe, photo, price, volume, myShell, shellOrCoin);
	}

	public void deleteCommodityById(Integer id) {
		dao.deleteCommodityById(id);
	}

	public Commodity findCommodityByName(String commodityName) {
		Commodity commodity = dao.findCommodityByName(commodityName);
		return commodity;
	}
	
	public Commodity updateCommodityById(String commodityName, String discribe, String photo, Integer price, Integer volume) {
		Commodity commodity = dao.updateCommodityById(commodityName, discribe, photo, price, volume, photo);
		return commodity;
	}

}
