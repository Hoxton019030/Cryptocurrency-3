package com.Group1.CoinShell.service.Yiwen;

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
