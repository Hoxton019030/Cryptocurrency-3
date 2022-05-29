package com.Group1.CoinShell.model.Yiwen;


import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface MembersDao extends JpaRepository<Members, Integer> {
	
	/**
	 * 會員登入
	 * @param eMail
	 * @param password
	 * @return
	 */
	@Query(value="SELECT * FROM Members WHERE E_Mail = :eMail2", nativeQuery = true)
	public Members findMemberByEMail(@Param("eMail2") String eMail);
	
	/**
	 * 參考課本第9-11
	 * @return
	 */

	@Query(value="SELECT MEMBERS.Id, MEMBERS.CustomizedUserAvatar, CustomizedUserAvatar.UserAvatar FROM MEMBERS LEFT JOIN CustomizedUserAvatar ON MEMBERS.Id = CustomizedUserAvatar.Id WHERE MEMBER.Id = ?1"
			, nativeQuery = true)
	public List<Map<String, Object>> updateMemberAvatar(@Param("MemId") Integer memId);
	
	@Query(value="SELECT * FROM Members WHERE Id = :memId2", nativeQuery = true)
	public Members findMemberById (@Param("memId2") Integer Id);
	
	@Modifying
	@Query(value="UPDATE Members SET CustomizedUserAvatar=:avatarNumber WHERE ID=:memId",nativeQuery = true)
	public void updateCustomizedUserAvatarById(@Param("avatarNumber") Integer avatarId, @Param("memId") Integer memId);
}
//	
//	@Query(value="select m from Members m where m.Id =?1")
//	public Members findById(String memId);
//	
//	// 沒有Service層，直接用controller呼叫Dao的話，要加@Transactional
//	// delete 跟 update 都要寫 modifying
//
//	/**
//	 * 更新會員頭像、用戶自訂名稱
//	 * @param memId
//	 * @param Members
//	 * @return
//	 */
//	@Transactional
//	@Modifying
//	@Query(value="update Members set CustomizedUserAvatar = ?1, "
//			+ "CustomizedUserName = ?2, where Id = memId", nativeQuery = true)
//	public Members updateUSettingById(Integer memId, Members Members);
//	
//	/**
//	 * 變更會員密碼
//	 * @param memId
//	 * @param Members
//	 * @return
//	 */
//	@Transactional
//	@Modifying
//	@Query(value="update Members set Password = ?1, where Id = memId", nativeQuery = true)
//	public Members updatePasswordById(Integer memId, Members Members);
//	
/////////////////////以下無關/////////////////////
//	
//	@Query("from Members where CustomizedUserName = :CustomizedUserName")
//	public List<Members> findByName(@Param(value = "customizedUserName") String customizedUserName);
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Repository;
//
//@Repository
//public class MembersDao {
//	
//	@Autowired
//	private SessionFactory factory;
//
//	public Members findByNameAndPassword(String eMail, String password) {
//		Session session = factory.getCurrentSession();
//		
//		String hql = "from Member m where m.memberName = :name and m.memberPwd = :pwd";
//		
//		try {
//			Members result = session.createQuery(hql, Members.class)
//					.setParameter("name", eMail)
//					.setParameter("pwd", password)
//					.getSingleResult();
//			if(result != null) {
//				return result;
//			}
//			
//		}catch(Exception e) {
//			e.printStackTrace();
//			return null;
//		}
//		
//		return null;
//	}
//
//}
