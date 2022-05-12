package Group1.MyShell.grabJsonToSqlDatabase.Group1.MyShell.grabJsonToSqlDatabase;

import java.net.MalformedURLException;
import java.net.URL;

public class getURL {

	private URL url;
	private String currecny;
	private String symbol;
	private int HowManyCryptocurrencyDoYouWnat = 200;

	public getURL(String currecny) {
		this.currecny = currecny;
		try {
			this.url = new URL(
					"https://api.coinmarketcap.com/data-api/v3/cryptocurrency/listing?start=1&limit="+HowManyCryptocurrencyDoYouWnat+"&sortBy=market_cap&sortType=desc&convert="
							+ currecny + "&cryptoType=all&tagType=all&audited=false");
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public URL getUrl() {
		return url;
	}

	public void setUrl(URL url) {
		this.url = url;
	}

	public String getCurrecny() {
		return currecny;
	}

	public void setCurrecny(String currecny) {
		this.currecny = currecny;
	}

	public String getSymbol() {
		return symbol;
	}

	public void setSymbol(String symbol) {
		this.symbol = symbol;
	}



}
