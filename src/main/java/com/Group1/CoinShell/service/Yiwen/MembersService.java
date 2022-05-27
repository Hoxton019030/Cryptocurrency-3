package com.Group1.CoinShell.service.Yiwen;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Group1.CoinShell.model.Yiwen.Members;
import com.Group1.CoinShell.model.Yiwen.MembersDao;

@Service
@Transactional
public class MembersService {

	@Autowired
	private MembersDao membersDao;

	public void save(Members members) {
		membersDao.save(members);
	}
	
	public Members findMemberByEMail(String eMail) {
		Members resMem = membersDao.findMemberByEMail(eMail);
		return resMem;
	}
	
	public void updateCustomizedUserAvatarById(Integer memId, Integer avatarId) {
		membersDao.updateCustomizedUserAvatarById(avatarId, memId);
			}
	
	// 缺少 MembersController (line 115 ~ 118)
//	public List<Map<String, Object>> updateMemberAvatar(Integer memId){
//		List<Map<String, Object>> resMem = membersDao.updateMemberAvatar(memId);
//		return resMem;
//	}
}
//	
//	public Members checkLogin(String eMail, String password) {
//		Members tempMember = dao.findByNameAndPassword(eMail, password);
//		
//		if(tempMember != null) {
//			return tempMember;
//		}
//		return null;
//		
//	}
//
//}
