package com.Group1.CoinShell.model.Yiwen;


import java.util.Date;
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
	
	@Query(value="SELECT MEMBERS.Id, MEMBERS.CustomizedUserAvatar, CustomizedUserAvatar.userAvatarBase64 FROM MEMBERS  			 LEFT JOIN CustomizedUserAvatar ON MEMBERS.CustomizedUserAvatar = CustomizedUserAvatar.Id WHERE Members.Id=:id2"
			, nativeQuery = true)
	public List<Map<String, Object>> updateMemberAvatar(@Param("id") Integer id);
	
	@Query(value="SELECT * FROM Members WHERE Id = :id2", nativeQuery = true)
	public Members findMemberById (@Param("id2") Integer Id);
	
	@Modifying
	@Query(value="UPDATE Members SET CustomizedUserAvatar=:avatarNumber WHERE ID=:id",nativeQuery = true)
	public void updateCustomizedUserAvatarById(@Param("avatarNumber") Integer avatarId, @Param("id") Integer id);
  
	
	@Query(value="SELECT * FROM MEMBERS", nativeQuery = true)
	public List<Members> findAllMembers();
	
	@Modifying
	@Query(value="UPDATE Members SET CustomizedUserName = :customizedUserName2  WHERE Id = :id2",nativeQuery = true)
	public void updateCustomizedUserNameById(@Param("customizedUserName2") String customizedUserName,@Param("id2")Integer id);
	
	// TODO insertMember
	@Query(value="INSERT INTO members (coin, customizedUserAvatar, customizedUserName, e_Mail, joinTime, myShell, password) "
			   + "VALUES(:coin2, :customizedUserAvatar2, :customizedUserName2, :e_Mail2, :joinTime2, :myShell2, :password2)", nativeQuery = true)
	public void insertMember(@Param("coin2")Integer coin,
							 @Param("customizedUserAvatar2")Integer customizedUserAvatar,
							 @Param("customizedUserName2")String customizedUserName,
							 @Param("e_Mail2")String eMail,
							 @Param("joinTime2")Date joinTime,
							 @Param("myShell2")Integer myShell,
							 @Param("password2")String password);
	
	@Modifying
	@Query(value = "DELETE FROM members WHERE id = :id2", nativeQuery = true)
	public void deleteMemberById(@Param("id2") Integer id);
	
	@Query(value = "SELECT * FROM members WHERE customizedUserName LIKE '%'+:customizedUserName2+'%'", nativeQuery = true)
	public List<Members> findMemberByName(@Param(value = "customizedUserName2") String customizedUserName);
	
	@Query(value = "UPDATE members SET coin = :coin2, customizedUserAvatar = :customizedUserAvatar2,"
			+ "customizedUserName = :customizedUserName2, e_Mail = :e_Mail2, joinTime = :joinTime2,"
			+ "myShell = :myShell2, password = :password2 WHERE id = :id2", nativeQuery = true)
	public void updateMemberById(@Param("coin2")Integer coin,
			 			  		 @Param("customizedUserAvatar2")Integer customizedUserAvatar,
			 					 @Param("customizedUserName2")String customizedUserName,
			 					 @Param("e_Mail2")String eMail,
			 					 @Param("joinTime2")Date joinTime,
			 					 @Param("myShell2")Integer myShell,
			 					 @Param("password2")String password,
			 					 @Param("id2")Integer id);
	
}

//	// 沒有Service層，直接用controller呼叫Dao的話，要加@Transactional
//	// delete 跟 update 都要寫 modifying

//	/**
//	 * 變更會員密碼
//	 * @param id
//	 * @param Members
//	 * @return
//	 */
//	@Transactional
//	@Modifying
//	@Query(value="update Members set Password = ?1, where Id = id", nativeQuery = true)
//	public Members updatePasswordById(Integer id, Members Members);
//	