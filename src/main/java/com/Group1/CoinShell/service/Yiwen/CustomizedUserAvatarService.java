package com.Group1.CoinShell.service.Yiwen;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Group1.CoinShell.model.Yiwen.CustomizedUserAvatar;
import com.Group1.CoinShell.model.Yiwen.CustomizedUserAvatarDao;

@Service
@Transactional
public class CustomizedUserAvatarService {

	@Autowired
	private CustomizedUserAvatarDao cuaDao;
	
	public void save(CustomizedUserAvatar cuAvatar) {
		cuaDao.save(cuAvatar);
	}
	
	public CustomizedUserAvatar findAvatarById(Integer id) {
		CustomizedUserAvatar resCua = cuaDao.findAvatarById(id);
		return resCua;
	}
	
	//Insert
	public void insertAvatar(String aliasAvatar, String userAvatarBase64) {
		cuaDao.insertAvatar(aliasAvatar, userAvatarBase64);
	}
	
	//DeletebyId
	public void deleteAvatarById(Integer id) {
		cuaDao.deleteAvatarById(id);
	}
	
	//findbyName
	public List<CustomizedUserAvatar> findAvatarByName(String aliasAvatar) {
		List<CustomizedUserAvatar> cuaList = cuaDao.findAvatarByName(aliasAvatar);
		return cuaList;
	}
	
	//findById
	
	//updateById
	
	//findAll
	public List<CustomizedUserAvatar> findAllAvatars(){
		List<CustomizedUserAvatar> cuaList = cuaDao.findAllAvatars();
		return cuaList;
	}
	
	
}
