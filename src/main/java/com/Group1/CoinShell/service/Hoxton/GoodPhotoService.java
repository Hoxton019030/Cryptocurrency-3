package com.Group1.CoinShell.service.Hoxton;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.Group1.CoinShell.model.Hoxton.GoodPhoto;
import com.Group1.CoinShell.model.Hoxton.GoodPhotoDao;

@Service
@Transactional
@EnableTransactionManagement
public class GoodPhotoService {
	
	@Autowired
	private GoodPhotoDao goodPhotoDao;

	@Transactional
	public GoodPhoto insertGoodPhoto(GoodPhoto gp) {
		return goodPhotoDao.saveGoodPhoto(gp);
	}
	
	public List<GoodPhoto> listGoodPhoto(){
		return goodPhotoDao.getAllPhoto();
	}
	
	public GoodPhoto getPhotoById(Integer id) {
		return goodPhotoDao.getPhotoById(id);
	}
	
	

}
