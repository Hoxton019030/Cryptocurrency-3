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

	public void updateCustomizedUserAvatarById(Integer id, Integer avatarId) {
		membersDao.updateCustomizedUserAvatarById(avatarId, id);
	}

//	public List<Map<String, Object>> selectMemberAvatar(Integer id) {
//		List<Map<String, Object>> member = membersDao.selectMemberAvatar(id);
//		return member;
//	}

	public List<Members> findAllMembers() {
		List<Members> member = membersDao.findAllMembers();
		return member;
	}
	
	public void updateCustomizedUserNameById(String customizedUserName,Integer id) {
		membersDao.updateCustomizedUserNameById(customizedUserName, id);
	}

}
