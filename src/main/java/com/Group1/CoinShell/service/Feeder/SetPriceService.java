package com.Group1.CoinShell.service.Feeder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.Group1.CoinShell.model.Feeder.SetPrice;
import com.Group1.CoinShell.model.Feeder.SetPriceDao;

@Service
@Transactional
public class SetPriceService {
	@Autowired
	private SetPriceDao setPriceDao;
	
	public void save(SetPrice setPrice) {
		setPriceDao.save(setPrice);
	}
} 
