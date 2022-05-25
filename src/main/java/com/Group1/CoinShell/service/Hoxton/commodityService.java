package com.Group1.CoinShell.service.Hoxton;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.Group1.CoinShell.model.Hoxton.commodity;
import com.Group1.CoinShell.model.Hoxton.commodityDao;

@Service
@Transactional
public class commodityService {
	
	@Autowired
	private commodityDao dao;
	
	public void insertcommodity(String commodityName,String discribe,String photo,Integer price,Integer volume) {
		dao.insertcommodity(commodityName, discribe, photo, price, volume);
	}
	public void deleteCommodityById(Integer id) {
		dao.deleteCommodityById(id);
		}
	
	public commodity findCommodityByName(String commodityName) {
	dao.findCommodityByName(commodityName);	
	}
	

}
