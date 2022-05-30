package com.Group1.CoinShell.service.Yiwen;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Group1.CoinShell.model.Yiwen.CustomizedUserAvatar;
import com.Group1.CoinShell.model.Yiwen.CustomizedUserAvatarDao;
import com.Group1.CoinShell.model.Yiwen.MembersDao;

@Service
@Transactional
public class CustomizedUserAvatarService {

	@Autowired
	private CustomizedUserAvatarDao cuaDao;
	@Autowired
	private MembersDao memDao;
	
	public void save(CustomizedUserAvatar cuAvatar) {
		cuaDao.save(cuAvatar);
	}
	
	public CustomizedUserAvatar findAvatarById(Integer id) {
		CustomizedUserAvatar resCua = cuaDao.findAvatarById(id);
		return resCua;
	}
	

	
}
