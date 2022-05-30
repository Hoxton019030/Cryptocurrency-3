package com.Group1.CoinShell.model.Feeder;

import java.util.List;
import java.util.Map;

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
	
	@Query(value="select * from coin where name = :name", nativeQuery=true)
	public Coin findByName3(@Param("name") String name);
	
	@Query(value="select * from coin where id = :id", nativeQuery=true)
	public List<Coin> findByCoinId(@Param("id") Integer id);
	
	@Query(value="select * from coin where symbol =:currencyName3",nativeQuery = true)
	public Coin findLastestCurrencyInformation(@Param("currencyName3")String currencyName); 
	
	//判斷memberId追蹤那些幣 設 flag=Y
	@Query(value=" select distinct c.*, case when w.coinId is not null then 'Y' else 'N' end as flag"
            + " from coin c "
            + " left join watch w on w.memberId = :memberId"
            + "                        and w.coinId = c.id "
            + " order by cmcRank asc ", nativeQuery=true)
	public List<Map<String, Object>> getCoin(Integer memberId);
	
	//如果未登入 memberId為空 則跑此無參方法
	@Query(value=" select c.*, 'N' as flag from coin c order by cmcRank asc ", nativeQuery=true)
	public List<Map<String, Object>> getCoin();
}
