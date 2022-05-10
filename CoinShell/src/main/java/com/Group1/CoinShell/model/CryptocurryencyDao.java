package com.Group1.CoinShell.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CryptocurryencyDao extends JpaRepository<Cryptocurrency,Integer>{
	
//	@Query(value = "from nameOfCryptocurrency where id=:id")
//	public List<Cryptocurrency> findName_of_CryptocurrencyById(@Param("id") Integer id);
	
//	@Query(value="SELECT TOP 1 * FROM Cryptocurrency  WHERE Symbol_of_Cryptocurrency =:currencyName1  ORDER BY Date DESC",nativeQuery = true)
//	public List<Cryptocurrency> findLastestCurrencyInformation(@Param("currecnyName1") String currencyName);
	
	@Query(value="SELECT TOP 1 * FROM cryptocurrency WHERE Symbol_of_Cryptocurrency = :currencyName1 ORDER BY Date DESC",nativeQuery = true)
	public Cryptocurrency findLastestCurrencyInformation(@Param("currencyName1") String currecnyName);

}