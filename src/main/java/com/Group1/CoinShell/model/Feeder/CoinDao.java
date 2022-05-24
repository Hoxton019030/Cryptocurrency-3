package com.Group1.CoinShell.model.Feeder;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CoinDao extends JpaRepository<Coin, Integer> {

	//給watch用name抓幣用
	@Query(value="select * from coin where name = :name", nativeQuery=true)
	public List<Coin> findByName(@Param("name") String name);
	
	//透過name跟symbol模糊查詢幣
	@Query(value = "select * from coin where name like %?1% or symbol like %?1% ORDER BY id asc", countQuery = "select count (*) from coin where name like %?1% or symbol like %?1%", nativeQuery = true)
    public List<Coin> findByName2(String name);
	
	@Query(value="select * from coin where symbol =:currencyName3",nativeQuery = true)
	public Coin findLastestCurrencyInformation(@Param("currencyName3")String currencyName); 
		
}
