package com.Group1.CoinShell.model;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CryptocurryencyDao extends JpaRepository<Cryptocurrency,Integer>{
	

	@Query(value="SELECT TOP 1 * FROM cryptocurrency WHERE Symbol_of_Cryptocurrency = :currencyName1 ORDER BY InformationDate DESC",nativeQuery = true)
	public Cryptocurrency findLastestCurrencyInformation(@Param("currencyName1") String currencyName);
	
//	@Query(value="SELECT symbol_of_cryptocurrency ,(SELECT USD_Price_of_Cryptocurrency FROM Cryptocurrency WHERE CONVERT(varchar,InformationDate,120) = (SELECT MAX(InformationDate) FROM Cryptocurrency WHERE CONVERT(varchar,InformationDate,120) like '%2022-05-13%' AND symbol_of_cryptocurrency=:currencyName2) AND symbol_of_cryptocurrency=:currencyName2) as 'TheFristUsdDate' ,(SELECT USD_Price_of_Cryptocurrency FROM Cryptocurrency WHERE CONVERT(varchar,InformationDate,120) = (SELECT MIN(InformationDate) FROM Cryptocurrency WHERE CONVERT(varchar,InformationDate,120) like '%2022-05-13%' AND symbol_of_cryptocurrency=:currencyName2) AND symbol_of_cryptocurrency=:currencyName2) as 'TheLastUsdDate' ,MAX(USD_Price_of_Cryptocurrency) AS 'TheHighestUsdPricePerUnit' ,MIN(USD_Price_of_Cryptocurrency)AS 'TheLowerUsdPricePerUnit' ,MAX(volume24hUsd)AS '24hUsdVolume' ,MAX(USD_Market_Cap)AS 'UsdMarkCap' ,(SELECT TWD_Price_of_Cryptocurrency FROM Cryptocurrency WHERE CONVERT(varchar,InformationDate,120) = (SELECT MAX(InformationDate) FROM Cryptocurrency WHERE CONVERT(varchar,InformationDate,120) like '%2022-05-13%' AND symbol_of_cryptocurrency=:currencyName2) AND symbol_of_cryptocurrency=:currencyName2) as 'TheFristTwdDate' ,(SELECT TWD_Price_of_Cryptocurrency FROM Cryptocurrency WHERE CONVERT(varchar,InformationDate,120) = (SELECT MIN(InformationDate) FROM Cryptocurrency WHERE CONVERT(varchar,InformationDate,120) like '%2022-05-13%' AND symbol_of_cryptocurrency=:currencyName2) AND symbol_of_cryptocurrency=:currencyName2) as 'TheLastTwdDate' ,MAX(TWD_Price_of_Cryptocurrency) AS 'TheHighestTwdPricePerUnit' ,MIN(TWD_Price_of_Cryptocurrency)AS 'TheLowerLowerPricePerUnit'     ,MAX(volume24hTwd)AS  '24hTwdVolume' ,MAX(TWD_Market_Cap) AS 'UsdMarkCap' from Cryptocurrency WHERE   CONVERT(varchar,InformationDate,120) LIKE '%:date2%' and symbol_of_cryptocurrency =:currencyName2 group by symbol_of_cryptocurrency ",nativeQuery = true)
	@Query(value="DECLARE @dayrr VARCHAR(10) =2022-05-13\r\n"
			+ "DECLARE @currencyName VARCHAR(10) ='BTC'\r\n"
			+ "\r\n"
			+ "SELECT symbol_of_cryptocurrency\r\n"
			+ ",(SELECT USD_Price_of_Cryptocurrency FROM Cryptocurrency WHERE CONVERT(varchar,InformationDate,120) = (SELECT MAX(InformationDate) FROM Cryptocurrency WHERE CONVERT(varchar,InformationDate,120) like '%2022-05-13%' AND symbol_of_cryptocurrency=@currencyName) AND symbol_of_cryptocurrency=@currencyName) as 'TheFristUsdDate'\r\n"
			+ ",(SELECT USD_Price_of_Cryptocurrency FROM Cryptocurrency WHERE CONVERT(varchar,InformationDate,120) = (SELECT MIN(InformationDate) FROM Cryptocurrency WHERE CONVERT(varchar,InformationDate,120) like '%2022-05-13%' AND symbol_of_cryptocurrency=@currencyName) AND symbol_of_cryptocurrency=@currencyName) as 'TheLastUsdDate'\r\n"
			+ ",MAX(USD_Price_of_Cryptocurrency) AS 'TheHighestUsdPricePerUnit'\r\n"
			+ ",MIN(USD_Price_of_Cryptocurrency)AS 'TheLowerUsdPricePerUnit'\r\n"
			+ ",MAX(volume24hUsd)AS '24hUsdVolume'\r\n"
			+ ",MAX(USD_Market_Cap)AS 'UsdMarkCap'\r\n"
			+ "\r\n"
			+ ",(SELECT TWD_Price_of_Cryptocurrency FROM Cryptocurrency WHERE CONVERT(varchar,InformationDate,120) = (SELECT MAX(InformationDate) FROM Cryptocurrency WHERE CONVERT(varchar,InformationDate,120) like '%2022-05-13%' AND symbol_of_cryptocurrency=@currencyName) AND symbol_of_cryptocurrency=@currencyName) as 'TheFristTwdDate'\r\n"
			+ ",(SELECT TWD_Price_of_Cryptocurrency FROM Cryptocurrency WHERE CONVERT(varchar,InformationDate,120) = (SELECT MIN(InformationDate) FROM Cryptocurrency WHERE CONVERT(varchar,InformationDate,120) like '%2022-05-13%' AND symbol_of_cryptocurrency=@currencyName) AND symbol_of_cryptocurrency=@currencyName) as 'TheLastTwdDate'\r\n"
			+ ",MAX(TWD_Price_of_Cryptocurrency) AS 'TheHighestTwdPricePerUnit'\r\n"
			+ ",MIN(TWD_Price_of_Cryptocurrency)AS 'TheLowerLowerPricePerUnit'    \r\n"
			+ ",MAX(volume24hTwd)AS  '24hTwdVolume'\r\n"
			+ ",MAX(TWD_Market_Cap) AS 'UsdMarkCap'\r\n"
			+ "\r\n"
			+ "from Cryptocurrency\r\n"
			+ "WHERE  \r\n"
			+ "CONVERT(varchar,InformationDate,120) LIKE '%2022-05-15%' and symbol_of_cryptocurrency =@currencyName\r\n"
			+ "group by symbol_of_cryptocurrency\r\n"
			+ "\r\n"
			+ "\r\n"
			+ "\r\n"
			+ "",nativeQuery = true)
	public Cryptocurrency findHistoricalCurrencyInformation(@Param("currencyName2")String currencyName,@Param("date2")String date);
	
	@Query(value = "DECLARE @dayrr VARCHAR(10) =2022-05-13\r\n"
			+ "DECLARE @currencyName VARCHAR(10) ='BTC'\r\n"
			+ "\r\n"
			+ "SELECT symbol_of_cryptocurrency\r\n"
			+ ",(SELECT USD_Price_of_Cryptocurrency FROM Cryptocurrency WHERE CONVERT(varchar,InformationDate,120) = (SELECT MAX(InformationDate) FROM Cryptocurrency WHERE CONVERT(varchar,InformationDate,120) like '%2022-05-13%' AND symbol_of_cryptocurrency=@currencyName) AND symbol_of_cryptocurrency=@currencyName) as 'TheFristUsdDate'\r\n"
			+ ",(SELECT USD_Price_of_Cryptocurrency FROM Cryptocurrency WHERE CONVERT(varchar,InformationDate,120) = (SELECT MIN(InformationDate) FROM Cryptocurrency WHERE CONVERT(varchar,InformationDate,120) like '%2022-05-13%' AND symbol_of_cryptocurrency=@currencyName) AND symbol_of_cryptocurrency=@currencyName) as 'TheLastUsdDate'\r\n"
			+ ",MAX(USD_Price_of_Cryptocurrency) AS 'TheHighestUsdPricePerUnit'\r\n"
			+ ",MIN(USD_Price_of_Cryptocurrency)AS 'TheLowerUsdPricePerUnit'\r\n"
			+ ",MAX(volume24hUsd)AS '24hUsdVolume'\r\n"
			+ ",MAX(USD_Market_Cap)AS 'UsdMarkCap'\r\n"
			+ "\r\n"
			+ ",(SELECT TWD_Price_of_Cryptocurrency FROM Cryptocurrency WHERE CONVERT(varchar,InformationDate,120) = (SELECT MAX(InformationDate) FROM Cryptocurrency WHERE CONVERT(varchar,InformationDate,120) like '%2022-05-13%' AND symbol_of_cryptocurrency=@currencyName) AND symbol_of_cryptocurrency=@currencyName) as 'TheFristTwdDate'\r\n"
			+ ",(SELECT TWD_Price_of_Cryptocurrency FROM Cryptocurrency WHERE CONVERT(varchar,InformationDate,120) = (SELECT MIN(InformationDate) FROM Cryptocurrency WHERE CONVERT(varchar,InformationDate,120) like '%2022-05-13%' AND symbol_of_cryptocurrency=@currencyName) AND symbol_of_cryptocurrency=@currencyName) as 'TheLastTwdDate'\r\n"
			+ ",MAX(TWD_Price_of_Cryptocurrency) AS 'TheHighestTwdPricePerUnit'\r\n"
			+ ",MIN(TWD_Price_of_Cryptocurrency)AS 'TheLowerLowerPricePerUnit'    \r\n"
			+ ",MAX(volume24hTwd)AS  '24hTwdVolume'\r\n"
			+ ",MAX(TWD_Market_Cap) AS 'UsdMarkCap'\r\n"
			+ "\r\n"
			+ "from Cryptocurrency\r\n"
			+ "WHERE  \r\n"
			+ "CONVERT(varchar,InformationDate,120) LIKE '%2022-05-15%' and symbol_of_cryptocurrency =@currencyName\r\n"
			+ "group by symbol_of_cryptocurrency\r\n"
			+ "\r\n"
			+ "\r\n"
			+ "\r\n"
			+ "",nativeQuery = true)
	public Cryptocurrency findHistoricalCurrencyInformation2();


	
}