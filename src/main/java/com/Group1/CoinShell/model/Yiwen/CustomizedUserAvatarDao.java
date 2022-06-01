package com.Group1.CoinShell.model.Yiwen;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CustomizedUserAvatarDao extends JpaRepository<CustomizedUserAvatar, Integer> {

	/**
	 * 加入使用者頭像
	 * 
	 * @param aliasAvatar
	 * @param userAvatarBase64
	 */
	@Query(value = "INSERT INTO CustomizedUserAvatar (aliasAvatar, userAvatarBase64) VALUES(:aliasAvatar2, :userAvatarBase642)", nativeQuery = true)
	public void insertAvatar(@Param("aliasAvatar2") String aliasAvatar,
			@Param("userAvatarBase642") String userAvatarBase64);

	/**
	 * 透過Id刪除使用者頭像
	 * 
	 * @param id
	 */
	@Modifying
	@Query(value = "DELETE FROM CustomizedUserAvatar WHERE id=:id2", nativeQuery = true)
	public void deleteAvatarById(@Param("id2") Integer id);

//findbyName
	@Query(value = "SELECT * FROM customizedUserAvatar WHER aliasAvatar LIKE '%'+:aliasAvatar2+'%'", nativeQuery = true)
	public List<CustomizedUserAvatar> findAvatarByName(@Param("aliasAvatar2") String aliasAvatar);

//findById
	@Query(value = "SELECT * FROM customizedUserAvatar WHERE id=:id2", nativeQuery = true)
	public CustomizedUserAvatar findAvatarById(@Param("id2") Integer id);

//updateById

//findAll
	@Query(value = "SELECT * FROM customizedUserAvatar", nativeQuery = true)
	public List<CustomizedUserAvatar> findAllAvatars();
}
