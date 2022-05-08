package Group1.MyShell.grabJsonToSqlDatabase;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.json.JSONArray;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import Group1.MyShell.MVC.model.CryptocurrencyBean;
import Group1.MyShell.util.HibernateUtils;

public class grabJsonToSqlDatabase {
	public static void main(String[] args) throws IOException, ParseException {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		String RootLocation = "./Json/";
		File file = new File(RootLocation);
		String[] currencyFolderNameList = file.list();
		File twdFile = new File(RootLocation + "TWD");
		String[] NumberOfTxtFile = twdFile.list();

		for (int count = 0; count < NumberOfTxtFile.length; count++) {
			ObjectMapper mapper = new ObjectMapper();
			String JsonWordTwd;
			String JsonWordUsd;
			File jsonTwdTxtFile = new File(RootLocation + "/TWD/" + NumberOfTxtFile[count]);
			File jsonUsdTxtFile = new File(RootLocation + "/USD/" + NumberOfTxtFile[count]);

			FileReader fileReaderTwdTxt = new FileReader(jsonTwdTxtFile);
			FileReader fileReaderUsdTxt = new FileReader(jsonUsdTxtFile);

			BufferedReader brTwd = new BufferedReader(fileReaderTwdTxt);
			BufferedReader brUsd = new BufferedReader(fileReaderUsdTxt);

			StringBuffer srTwd = new StringBuffer();
			StringBuffer srUsd = new StringBuffer();

			while ((JsonWordTwd = brTwd.readLine()) != null) {
				srTwd.append(JsonWordTwd);
			}
			while ((JsonWordUsd = brUsd.readLine()) != null) {
				srUsd.append(JsonWordUsd);
			}
			JsonNode nodeTwd = mapper.readTree(srTwd.toString());
			JsonNode nodeUsd = mapper.readTree(srUsd.toString());

			String dataNodeTwd = nodeTwd.get("data").get("cryptoCurrencyList").toString();
			String dataNodeUsd = nodeUsd.get("data").get("cryptoCurrencyList").toString();

			JSONArray jsonArrayTwd = new JSONArray(dataNodeTwd);
			JSONArray jsonArrayUsd = new JSONArray(dataNodeUsd);

			for (int i = 0; i < jsonArrayTwd.length(); i++) {
				CryptocurrencyBean crypto = new CryptocurrencyBean();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
				Date date = sdf.parse(NumberOfTxtFile[count].substring(0, 19)); 
				System.out.println(date);
				String name = nodeTwd.get("data").get("cryptoCurrencyList").get(i).get("name").asText();
				String symbol = nodeTwd.get("data").get("cryptoCurrencyList").get(i).get("symbol").asText();
				String slug = nodeTwd.get("data").get("cryptoCurrencyList").get(i).get("slug").asText();
				Double circulatingSupply = nodeTwd.get("data").get("cryptoCurrencyList").get(i)
						.get("circulatingSupply").asDouble();
				Double totalSupply = nodeTwd.get("data").get("cryptoCurrencyList").get(i).get("totalSupply").asDouble();
				Double maxSupply = null;

				try {
					maxSupply = nodeTwd.get("data").get("cryptoCurrencyList").get(i).get("maxSupply").asDouble();
				} catch (Exception e) {
					maxSupply = 0.0;
				} finally {
					crypto.setMaxSupply(maxSupply);
				}

				
				Double twdPriceOfCryptocurrency = nodeTwd.get("data").get("cryptoCurrencyList").get(i).get("quotes")
						.get(0).get("price").asDouble();
				Double twdMarketCap = nodeTwd.get("data").get("cryptoCurrencyList").get(i).get("quotes").get(0)
						.get("marketCap").asDouble();
				Double usdPriceOfCryptocurrency = nodeUsd.get("data").get("cryptoCurrencyList").get(i).get("quotes")
						.get(0).get("price").asDouble();
				Double usdMarketCap = nodeUsd.get("data").get("cryptoCurrencyList").get(i).get("quotes").get(0)
						.get("marketCap").asDouble();
				Double volume24h = nodeTwd.get("data").get("cryptoCurrencyList").get(i).get("quotes").get(0)
						.get("volume24h").asDouble();
				Double percentChange1h = nodeTwd.get("data").get("cryptoCurrencyList").get(i).get("quotes").get(0)
						.get("percentChange1h").asDouble();
				Double percentChange24h = nodeTwd.get("data").get("cryptoCurrencyList").get(i).get("quotes").get(0)
						.get("percentChange24h").asDouble();
				Double percentChange7d = nodeTwd.get("data").get("cryptoCurrencyList").get(i).get("quotes").get(0)
						.get("percentChange7d").asDouble();
				Double percentChange30d = nodeTwd.get("data").get("cryptoCurrencyList").get(i).get("quotes").get(0)
						.get("percentChange30d").asDouble();
				Double percentChange60d = nodeTwd.get("data").get("cryptoCurrencyList").get(i).get("quotes").get(0)
						.get("percentChange60d").asDouble();
				Double percentChange90d = nodeTwd.get("data").get("cryptoCurrencyList").get(i).get("quotes").get(0)
						.get("percentChange90d").asDouble();
				Double fullyDilluttedMarketCapTwd = nodeTwd.get("data").get("cryptoCurrencyList").get(i).get("quotes")
						.get(0).get("fullyDilluttedMarketCap").asDouble();
				Double fullyDilluttedMarketCapUsd = nodeUsd.get("data").get("cryptoCurrencyList").get(i).get("quotes")
						.get(0).get("fullyDilluttedMarketCap").asDouble();
				Double ytdPriceChangePercentageTwd = nodeTwd.get("data").get("cryptoCurrencyList").get(i).get("quotes")
						.get(0).get("ytdPriceChangePercentage").asDouble();
				Double ytdPriceChangePercentageUsd = nodeUsd.get("data").get("cryptoCurrencyList").get(i).get("quotes")
						.get(0).get("ytdPriceChangePercentage").asDouble();

				crypto.setDate(date);
				crypto.setNameOfCryptocurrency(name);
				crypto.setSymbolOfCryptocurrency(symbol);
				crypto.setSlugOfCryptocurrency(slug);
				crypto.setTotalSupply(totalSupply);
				crypto.setCirculatingSupply(circulatingSupply);
				crypto.setTwdPriceOfCryptocurrency(twdPriceOfCryptocurrency);
				crypto.setUsdPriceOfCryptocurrency(usdPriceOfCryptocurrency);
				crypto.setVolume24h(volume24h);
				crypto.setPercentChange1h(percentChange1h);
				crypto.setPercentChange24h(percentChange24h);
				crypto.setPercentChange7d(percentChange7d);
				crypto.setPercentChange30d(percentChange30d);
				crypto.setPercentChange60d(percentChange60d);
				crypto.setPercentChange90d(percentChange90d);
				crypto.setTwdFullyDilutedMarketCap(fullyDilluttedMarketCapTwd);
				crypto.setUsdFullyDilutedMarketCap(fullyDilluttedMarketCapUsd);
				crypto.setYtdPriceChangePercentageTwd(ytdPriceChangePercentageTwd);
				crypto.setYtdPriceChangePercentageUsd(ytdPriceChangePercentageUsd);
				crypto.setUsdMarketCap(usdMarketCap);
				crypto.setTwdMarketCap(twdMarketCap);
				

//				CryptocurrencyBean cryptocurrencyBean = new CryptocurrencyBean(date, name, symbol, slug, maxSupply,
//						circulatingSupply, totalSupply, percentChange1h, ytdPriceChangePercentageTwd,
//						ytdPriceChangePercentageUsd, percentChange24h, percentChange7d, percentChange30d,
//						percentChange60d, percentChange90d, twdPriceOfCryptocurrency, twdMarketCap,
//						fullyDilluttedMarketCapTwd, usdPriceOfCryptocurrency, usdMarketCap, fullyDilluttedMarketCapUsd, volume24h);
				session.beginTransaction();
				session.save(crypto);
				session.getTransaction().commit();
				System.out.println("done");

			}

		}

		/*
		 * 取得所有幣別的資料夾(USD,TWD)
		 */
//		for (int i = 0; i < currencyFolderNameList.length; i++) {
//			String currencyFileLocation = RootLocation + currencyFolderNameList[i];
//			File currencyFile = new File(currencyFileLocation);
//			String[] jsonTxtFileList = currencyFile.list();
//
		/*
		 * 取得資料夾內的檔案
		 */
//			for (int j = 0; j < jsonTxtFileList.length; j++) {
//				String JsonWord;
//				ObjectMapper mapper = new ObjectMapper();
//				File jsonTxtFile = new File(currencyFileLocation + "/" + jsonTxtFileList[j]);
//				FileReader fileReader = new FileReader(jsonTxtFile);
//				BufferedReader br = new BufferedReader(fileReader);
//				StringBuffer sr = new StringBuffer();
//				while ((JsonWord = br.readLine()) != null) {
//					sr.append(JsonWord);
//				}
//				JsonNode node = mapper.readTree(sr.toString());
//				String dataNode = node.get("data").get("cryptoCurrencyList").toString();
//				JSONArray jArray = new JSONArray(dataNode);
//
		/*
		 * 將資料夾內的json.txt 遍歷
		 */
//				for (int k = 0; k < jArray.length(); k++) {
//					String name = node.get("data").get("cryptoCurrencyList").get(k).get("name").asText();
//					System.out.println(name);
//				}
//			}
//
//		}

	}

}
