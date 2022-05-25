package com.Group1.CoinShell.model.Hoxton;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CommodityDao extends JpaRepository<Commodity,Integer>{
	/**
	 * 加入商品
	 */
	@Query(value="INSERT INTO commodity (commodity_name,discribe,photo,price,volume) VALUES( :commodityName2,:discribe2,:photo2,:price2,:volume2)",nativeQuery = true)
	public void insertcommodity(@Param("commodityName2")String commodityName,@Param("discribe2")String discribe,@Param("photo2")String photo,@Param("price2")Integer price,@Param("volume2")Integer volume);
	
	/**
	 * 透過Id刪除商品
	 * @param id :商品id
	 */
	@Query(value="DELETE FROM commodity WHERE id=:id2",nativeQuery = true)
	public void deleteCommodityById (@Param("id2")Integer id);
	
	@Query(value="SELECT * FROM commodity WHERE commodity_name LIKE '%:commodityName2%'",nativeQuery = true)
	public Commodity findCommodityByName (@Param("commodityName2") String commodityName);
	
	@Query(value="UPDATE commodity SET commodity_name=:commodityName2 ,discribe=:discribe2,photo=:photo2,price =:price2,volume=:volume2  WHERE ID =:id2",nativeQuery = true)
	public Commodity updateCommodityById(@Param("commodityName2")String commodityName,@Param("discribe2")String discribe,@Param("photo2")String photo,@Param("price2")Integer price,@Param("volume2")Integer volume,@Param("id2")String id);

}
