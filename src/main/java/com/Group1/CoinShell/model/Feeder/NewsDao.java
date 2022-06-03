package com.Group1.CoinShell.model.Feeder;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface NewsDao extends JpaRepository <News, Integer>{

	@Query(value="select * from News where id = :id", nativeQuery=true)
	public List<News> findByNewsId(@Param("id") Integer id);
}
