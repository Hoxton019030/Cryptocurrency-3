package Group1.MyShell.MVC.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Cryptocurrency")
public class CryptocurrencyBean {

	public CryptocurrencyBean() {
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", columnDefinition = "INT")
	private Integer id;

	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "Date", columnDefinition = "datetime")
	private String date;

	@Column(name = "Name_of_Cryptocurrency", columnDefinition = "NVARCHAR(50)")
	private String nameOfCryptocurrency;

	@Column(name = "Symbol_of_Cryptocurrency", columnDefinition = "NVARCHAR(50)")
	private String symbolOfCryptocurrency;

	@Column(name = "Slug_of_Cryptocurrency", columnDefinition = "NVARCHAR(50)")
	private String slugOfCryptocurrency;

	@Column(name = "Max_Supply", columnDefinition = "INT")
	private Integer maxSupply;

	@Column(name = "Circulating_Supply", columnDefinition = "INT")
	private Integer circulatingSupply;

	@Column(name = "Percent_Change_1h", columnDefinition = "DECIMAL(12,8)")
	private double percentChange1h;

	@Column(name = "Percent_Change_24h", columnDefinition = "DECIMAL(12,8)")
	private double percentChange24h;

	@Column(name = "Percent_Change_7d", columnDefinition = "DECIMAL(12,8)")
	private double percentChange7d;

	@Column(name = "Percent_Change_30d", columnDefinition = "DECIMAL(12,8)")
	private double percentChange30d;

	@Column(name = "Percent_Change_60d", columnDefinition = "DECIMAL(12,8)")
	private double percentChange60d;

	@Column(name = "Percent_Change_90d", columnDefinition = "DECIMAL(12,8)")
	private double percentChange90d;

	@Column(name = "TWD_Price_of_Cryptocurrency", columnDefinition = "DECIMAL(12,8)")
	private double twdPriceOfCryptocurrency;

	@Column(name = "TWD_Market_Cap", columnDefinition = "DECIMAL(12,8)")
	private double twdMarketCap;

	@Column(name = "TWD_Fully_Diluted_Market_Cap", columnDefinition = "DECIMAL(12,8)")
	private double twdFullyDilutedMarketCap;

	@Column(name = "USD_Price_of_Cryptocurrency", columnDefinition = "DECIMAL(12,8)")
	private double usdPriceOfCryptocurrency;

	@Column(name = "USD_Market_Cap", columnDefinition = "DECIMAL(12,8)")
	private double usdMarketCap;

	@Column(name = "USD_Fully_Diluted_Market_Cap", columnDefinition = "DECIMAL(12,8)")
	private double usdFullyDilutedMarketCap;

	@Column(name = "CNY_Price_of_Cryptocurrency", columnDefinition = "DECIMAL(12,8)")
	private double cnyPriceOfCryptocurrency;

	@Column(name = "CNY_Market_Cap", columnDefinition = "DECIMAL(12,8)")
	private double cnyMarketCap;

	@Column(name = "CNY_Fully_Diluted_Market_Cap", columnDefinition = "DECIMAL(12,8)")
	private double cnyFullyDilutedMarketCap;

	@Column(name = "JPY_Price_of_Cryptocurrency", columnDefinition = "DECIMAL(12,8)")
	private double jpyPriceOfCryptocurrency;

	@Column(name = "JPY_Market_Cap", columnDefinition = "DECIMAL(12,8)")
	private double jpyMarketCap;

	@Column(name = "JPY_Fully_Diluted_Market_Cap", columnDefinition = "DECIMAL(12,8)")
	private double jpyFullyDilutedMarketCap;

	@Column(name = "EUR_Price_of_Cryptocurrency", columnDefinition = "DECIMAL(12,8)")
	private double eurPriceOfCryptocurrency;

	@Column(name = "EUR_Market_Cap", columnDefinition = "DECIMAL(12,8)")
	private double eurMarketCap;

	@Column(name = "EUR_Fully_Diluted_Market_Cap", columnDefinition = "DECIMAL(12,8)")
	private double eurFullyDilutedMarketCap;

	public CryptocurrencyBean(Integer id, String date, String nameOfCryptocurrency, String symbolOfCryptocurrency,
			String slugOfCryptocurrency, Integer maxSupply, Integer circulatingSupply, double percentChange1h,
			double percentChange24h, double percentChange7d, double percentChange30d, double percentChange60d,
			double percentChange90d, double twdPriceOfCryptocurrency, double twdMarketCap,
			double twdFullyDilutedMarketCap, double usdPriceOfCryptocurrency, double usdMarketCap,
			double usdFullyDilutedMarketCap, double cnyPriceOfCryptocurrency, double cnyMarketCap,
			double cnyFullyDilutedMarketCap, double jpyPriceOfCryptocurrency, double jpyMarketCap,
			double jpyFullyDilutedMarketCap, double eurPriceOfCryptocurrency, double eurMarketCap,
			double eurFullyDilutedMarketCap) {
		super();
		this.id = id;
		this.date = date;
		this.nameOfCryptocurrency = nameOfCryptocurrency;
		this.symbolOfCryptocurrency = symbolOfCryptocurrency;
		this.slugOfCryptocurrency = slugOfCryptocurrency;
		this.maxSupply = maxSupply;
		this.circulatingSupply = circulatingSupply;
		this.percentChange1h = percentChange1h;
		this.percentChange24h = percentChange24h;
		this.percentChange7d = percentChange7d;
		this.percentChange30d = percentChange30d;
		this.percentChange60d = percentChange60d;
		this.percentChange90d = percentChange90d;
		this.twdPriceOfCryptocurrency = twdPriceOfCryptocurrency;
		this.twdMarketCap = twdMarketCap;
		this.twdFullyDilutedMarketCap = twdFullyDilutedMarketCap;
		this.usdPriceOfCryptocurrency = usdPriceOfCryptocurrency;
		this.usdMarketCap = usdMarketCap;
		this.usdFullyDilutedMarketCap = usdFullyDilutedMarketCap;
		this.cnyPriceOfCryptocurrency = cnyPriceOfCryptocurrency;
		this.cnyMarketCap = cnyMarketCap;
		this.cnyFullyDilutedMarketCap = cnyFullyDilutedMarketCap;
		this.jpyPriceOfCryptocurrency = jpyPriceOfCryptocurrency;
		this.jpyMarketCap = jpyMarketCap;
		this.jpyFullyDilutedMarketCap = jpyFullyDilutedMarketCap;
		this.eurPriceOfCryptocurrency = eurPriceOfCryptocurrency;
		this.eurMarketCap = eurMarketCap;
		this.eurFullyDilutedMarketCap = eurFullyDilutedMarketCap;
	}

	@Override
	public String toString() {
		return "CryptocurrencyBean [id=" + id + ", date=" + date + ", nameOfCryptocurrency=" + nameOfCryptocurrency
				+ ", symbolOfCryptocurrency=" + symbolOfCryptocurrency + ", slugOfCryptocurrency="
				+ slugOfCryptocurrency + ", maxSupply=" + maxSupply + ", circulatingSupply=" + circulatingSupply
				+ ", percentChange1h=" + percentChange1h + ", percentChange24h=" + percentChange24h
				+ ", percentChange7d=" + percentChange7d + ", percentChange30d=" + percentChange30d
				+ ", percentChange60d=" + percentChange60d + ", percentChange90d=" + percentChange90d
				+ ", twdPriceOfCryptocurrency=" + twdPriceOfCryptocurrency + ", twdMarketCap=" + twdMarketCap
				+ ", twdFullyDilutedMarketCap=" + twdFullyDilutedMarketCap + ", usdPriceOfCryptocurrency="
				+ usdPriceOfCryptocurrency + ", usdMarketCap=" + usdMarketCap + ", usdFullyDilutedMarketCap="
				+ usdFullyDilutedMarketCap + ", cnyPriceOfCryptocurrency=" + cnyPriceOfCryptocurrency
				+ ", cnyMarketCap=" + cnyMarketCap + ", cnyFullyDilutedMarketCap=" + cnyFullyDilutedMarketCap
				+ ", jpyPriceOfCryptocurrency=" + jpyPriceOfCryptocurrency + ", jpyMarketCap=" + jpyMarketCap
				+ ", jpyFullyDilutedMarketCap=" + jpyFullyDilutedMarketCap + ", eurPriceOfCryptocurrency="
				+ eurPriceOfCryptocurrency + ", eurMarketCap=" + eurMarketCap + ", eurFullyDilutedMarketCap="
				+ eurFullyDilutedMarketCap + "]";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getNameOfCryptocurrency() {
		return nameOfCryptocurrency;
	}

	public void setNameOfCryptocurrency(String nameOfCryptocurrency) {
		this.nameOfCryptocurrency = nameOfCryptocurrency;
	}

	public String getSymbolOfCryptocurrency() {
		return symbolOfCryptocurrency;
	}

	public void setSymbolOfCryptocurrency(String symbolOfCryptocurrency) {
		this.symbolOfCryptocurrency = symbolOfCryptocurrency;
	}

	public String getSlugOfCryptocurrency() {
		return slugOfCryptocurrency;
	}

	public void setSlugOfCryptocurrency(String slugOfCryptocurrency) {
		this.slugOfCryptocurrency = slugOfCryptocurrency;
	}

	public Integer getMaxSupply() {
		return maxSupply;
	}

	public void setMaxSupply(Integer maxSupply) {
		this.maxSupply = maxSupply;
	}

	public Integer getCirculatingSupply() {
		return circulatingSupply;
	}

	public void setCirculatingSupply(Integer circulatingSupply) {
		this.circulatingSupply = circulatingSupply;
	}

	public double getPercentChange1h() {
		return percentChange1h;
	}

	public void setPercentChange1h(double percentChange1h) {
		this.percentChange1h = percentChange1h;
	}

	public double getPercentChange24h() {
		return percentChange24h;
	}

	public void setPercentChange24h(double percentChange24h) {
		this.percentChange24h = percentChange24h;
	}

	public double getPercentChange7d() {
		return percentChange7d;
	}

	public void setPercentChange7d(double percentChange7d) {
		this.percentChange7d = percentChange7d;
	}

	public double getPercentChange30d() {
		return percentChange30d;
	}

	public void setPercentChange30d(double percentChange30d) {
		this.percentChange30d = percentChange30d;
	}

	public double getPercentChange60d() {
		return percentChange60d;
	}

	public void setPercentChange60d(double percentChange60d) {
		this.percentChange60d = percentChange60d;
	}

	public double getPercentChange90d() {
		return percentChange90d;
	}

	public void setPercentChange90d(double percentChange90d) {
		this.percentChange90d = percentChange90d;
	}

	public double getTwdPriceOfCryptocurrency() {
		return twdPriceOfCryptocurrency;
	}

	public void setTwdPriceOfCryptocurrency(double twdPriceOfCryptocurrency) {
		this.twdPriceOfCryptocurrency = twdPriceOfCryptocurrency;
	}

	public double getTwdMarketCap() {
		return twdMarketCap;
	}

	public void setTwdMarketCap(double twdMarketCap) {
		this.twdMarketCap = twdMarketCap;
	}

	public double getTwdFullyDilutedMarketCap() {
		return twdFullyDilutedMarketCap;
	}

	public void setTwdFullyDilutedMarketCap(double twdFullyDilutedMarketCap) {
		this.twdFullyDilutedMarketCap = twdFullyDilutedMarketCap;
	}

	public double getUsdPriceOfCryptocurrency() {
		return usdPriceOfCryptocurrency;
	}

	public void setUsdPriceOfCryptocurrency(double usdPriceOfCryptocurrency) {
		this.usdPriceOfCryptocurrency = usdPriceOfCryptocurrency;
	}

	public double getUsdMarketCap() {
		return usdMarketCap;
	}

	public void setUsdMarketCap(double usdMarketCap) {
		this.usdMarketCap = usdMarketCap;
	}

	public double getUsdFullyDilutedMarketCap() {
		return usdFullyDilutedMarketCap;
	}

	public void setUsdFullyDilutedMarketCap(double usdFullyDilutedMarketCap) {
		this.usdFullyDilutedMarketCap = usdFullyDilutedMarketCap;
	}

	public double getCnyPriceOfCryptocurrency() {
		return cnyPriceOfCryptocurrency;
	}

	public void setCnyPriceOfCryptocurrency(double cnyPriceOfCryptocurrency) {
		this.cnyPriceOfCryptocurrency = cnyPriceOfCryptocurrency;
	}

	public double getCnyMarketCap() {
		return cnyMarketCap;
	}

	public void setCnyMarketCap(double cnyMarketCap) {
		this.cnyMarketCap = cnyMarketCap;
	}

	public double getCnyFullyDilutedMarketCap() {
		return cnyFullyDilutedMarketCap;
	}

	public void setCnyFullyDilutedMarketCap(double cnyFullyDilutedMarketCap) {
		this.cnyFullyDilutedMarketCap = cnyFullyDilutedMarketCap;
	}

	public double getJpyPriceOfCryptocurrency() {
		return jpyPriceOfCryptocurrency;
	}

	public void setJpyPriceOfCryptocurrency(double jpyPriceOfCryptocurrency) {
		this.jpyPriceOfCryptocurrency = jpyPriceOfCryptocurrency;
	}

	public double getJpyMarketCap() {
		return jpyMarketCap;
	}

	public void setJpyMarketCap(double jpyMarketCap) {
		this.jpyMarketCap = jpyMarketCap;
	}

	public double getJpyFullyDilutedMarketCap() {
		return jpyFullyDilutedMarketCap;
	}

	public void setJpyFullyDilutedMarketCap(double jpyFullyDilutedMarketCap) {
		this.jpyFullyDilutedMarketCap = jpyFullyDilutedMarketCap;
	}

	public double getEurPriceOfCryptocurrency() {
		return eurPriceOfCryptocurrency;
	}

	public void setEurPriceOfCryptocurrency(double eurPriceOfCryptocurrency) {
		this.eurPriceOfCryptocurrency = eurPriceOfCryptocurrency;
	}

	public double getEurMarketCap() {
		return eurMarketCap;
	}

	public void setEurMarketCap(double eurMarketCap) {
		this.eurMarketCap = eurMarketCap;
	}

	public double getEurFullyDilutedMarketCap() {
		return eurFullyDilutedMarketCap;
	}

	public void setEurFullyDilutedMarketCap(double eurFullyDilutedMarketCap) {
		this.eurFullyDilutedMarketCap = eurFullyDilutedMarketCap;
	}

}
