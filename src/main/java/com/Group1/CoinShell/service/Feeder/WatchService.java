package com.Group1.CoinShell.service.Feeder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.Group1.CoinShell.model.Feeder.Watch;
import com.Group1.CoinShell.model.Feeder.WatchDao;

@Service
@Transactional
public class WatchService {
	
	@Autowired
	private WatchDao watchDao;
	
	public void save(Watch watch) {
		watchDao.save(watch);
	
	}
}
