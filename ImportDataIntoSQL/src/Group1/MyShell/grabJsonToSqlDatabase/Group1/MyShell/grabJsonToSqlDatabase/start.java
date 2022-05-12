package Group1.MyShell.grabJsonToSqlDatabase.Group1.MyShell.grabJsonToSqlDatabase;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.json.JSONArray;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import Group1.MyShell.MVC.model.CryptocurrencyBean;
import Group1.MyShell.util.HibernateUtils;

public class start {
	public static void main(String[] args) throws IOException, ParseException, InterruptedException {
		for (int count = 0; count < 10; count++) {
			LocalDateTime nowTime = LocalDateTime.now();
			// TodaysDates == 2022-05-01T20:53:20.086025200
			SessionFactory factory = HibernateUtils.getSessionFactory();
			Session session = factory.openSession();

			String[] splitString = nowTime.toString().split("\\.");
			// TodaysDates == 2022-05-01T20:53:20

			String datetime = splitString[0].replace(":", "-").replace("T", " ");
			// TodaysDates == 2022-05-01 20-53-20

			// 這個迴圈控制重複次數
			List<URL> urlList = new ArrayList<URL>();
			String JSONtxtUsd = "";
			String JSONtxtTwd = "";
			String[] fiatCurrencyList = { "USD", "TWD" };

			for (int i = 0; i < fiatCurrencyList.length; i++) {
				urlList.add(new getURL(fiatCurrencyList[i]).getUrl());
			}

			URL usdUrl = new getURL("USD").getUrl();
			URL twdUrl = new getURL("TWD").getUrl();

			InputStream openStreamUsd = usdUrl.openStream();
			InputStream openStreamTwd = twdUrl.openStream();

			InputStreamReader irUsd = new InputStreamReader(openStreamUsd);
			InputStreamReader irTwd = new InputStreamReader(openStreamTwd);

			BufferedReader brUsd = new BufferedReader(irUsd);
			BufferedReader brTwd = new BufferedReader(irTwd);

			StringBuffer srUsd = new StringBuffer();
			StringBuffer srTwd = new StringBuffer();

			while ((JSONtxtUsd = brUsd.readLine()) != null) {
				srUsd.append(JSONtxtUsd);
			}

			while ((JSONtxtTwd = brTwd.readLine()) != null) {
				srTwd.append(JSONtxtTwd);
			}

			ObjectMapper mapper = new ObjectMapper();
			JsonNode nodeTwd = mapper.readTree(srTwd.toString());
			JsonNode nodeUsd = mapper.readTree(srUsd.toString());

			String dataNodeTwd = nodeTwd.get("data").get("cryptoCurrencyList").toString();
			String dataNodeUsd = nodeUsd.get("data").get("cryptoCurrencyList").toString();

			JSONArray jsonArrayTwd = new JSONArray(dataNodeTwd);
			JSONArray jsonArrayUsd = new JSONArray(dataNodeUsd);

			for (int i = 0; i < jsonArrayTwd.length(); i++) {
				CryptocurrencyBean crypto = new CryptocurrencyBean();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
				Date date = sdf.parse(datetime.substring(0, 19));
				System.out.println(date);
				String name = nodeTwd.get("data").get("cryptoCurrencyList").get(i).get("name").asText();
				String symbol = nodeTwd.get("data").get("cryptoCurrencyList").get(i).get("symbol").asText();
				String slug = nodeTwd.get("data").get("cryptoCurrencyList").get(i).get("slug").asText();
				Double circulatingSupply = nodeTwd.get("data").get("cryptoCurrencyList").get(i).get("circulatingSupply")
						.asDouble();
				Double totalSupply = nodeTwd.get("data").get("cryptoCurrencyList").get(i).get("totalSupply").asDouble();
				Double maxSupply = null;

				try {
					double bigDecimal = nodeTwd.get("data").get("cryptoCurrencyList").get(i).get("maxSupply")
							.asDouble();
					maxSupply = new BigDecimal(bigDecimal).doubleValue();
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

//			CryptocurrencyBean cryptocurrencyBean = new CryptocurrencyBean(date, name, symbol, slug, maxSupply,
//					circulatingSupply, totalSupply, percentChange1h, ytdPriceChangePercentageTwd,
//					ytdPriceChangePercentageUsd, percentChange24h, percentChange7d, percentChange30d,
//					percentChange60d, percentChange90d, twdPriceOfCryptocurrency, twdMarketCap,
//					fullyDilluttedMarketCapTwd, usdPriceOfCryptocurrency, usdMarketCap, fullyDilluttedMarketCapUsd, volume24h);
				session.beginTransaction();
				session.save(crypto);
				session.getTransaction().commit();
				System.out.println("done");

			}
			Thread.sleep(10800000);
		}
	}

}
