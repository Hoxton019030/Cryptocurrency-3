package com.Group1.CoinShell.model.Yiwen;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CustomizedUserAvatarDao extends JpaRepository<CustomizedUserAvatar, Integer> {

@Query(value="SELECT * FROM CustomizedUserAvatar WHERE id = :id2", nativeQuery=true)
public CustomizedUserAvatar findAvatarById(@Param("id2") Integer id);

}
