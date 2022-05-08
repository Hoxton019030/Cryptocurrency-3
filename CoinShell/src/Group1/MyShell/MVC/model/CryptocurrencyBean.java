package Group1.MyShell.MVC.model;

import java.util.Date;

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
	private Date date;

	@Column(name = "Name_of_Cryptocurrency", columnDefinition = "NVARCHAR(50)")
	private String nameOfCryptocurrency;

	@Column(name = "Symbol_of_Cryptocurrency", columnDefinition = "NVARCHAR(50)")
	private String symbolOfCryptocurrency;

	@Column(name = "Slug_of_Cryptocurrency", columnDefinition = "NVARCHAR(50)")
	private String slugOfCryptocurrency;

	@Column(name = "Max_Supply", columnDefinition = "INT")
	private Double maxSupply;

	@Column(name = "Circulating_Supply", columnDefinition = "INT")
	private Double circulatingSupply;
	
	@Column(name = "Total_Supply", columnDefinition = "INT")
	private Double totalSupply;

	public Double getTotalSupply() {
		return totalSupply;
	}

	public void setTotalSupply(Double totalSupply2) {
		this.totalSupply = totalSupply2;
	}

	@Column(name = "Percent_Change_1h", columnDefinition = "DECIMAL(12,8)")
	private double percentChange1h;
	
	@Column(name = "ytdPriceChangePercentageTwd", columnDefinition = "DECIMAL(12,8)")
	private double ytdPriceChangePercentageTwd;
	
	public double getYtdPriceChangePercentageTwd() {
		return ytdPriceChangePercentageTwd;
	}

	public void setYtdPriceChangePercentageTwd(double ytdPriceChangePercentageTwd) {
		this.ytdPriceChangePercentageTwd = ytdPriceChangePercentageTwd;
	}

	public double getYtdPriceChangePercentageUsd() {
		return ytdPriceChangePercentageUsd;
	}

	public void setYtdPriceChangePercentageUsd(double ytdPriceChangePercentageUsd) {
		this.ytdPriceChangePercentageUsd = ytdPriceChangePercentageUsd;
	}

	@Column(name = "ytdPriceChangePercentageUsd", columnDefinition = "DECIMAL(12,8)")
	private double ytdPriceChangePercentageUsd;

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

	
	@Column(name = "volume24h", columnDefinition = "DECIMAL(12,8)")
	private double volume24h;
	
	

	public CryptocurrencyBean( Date date, String nameOfCryptocurrency, String symbolOfCryptocurrency,
			String slugOfCryptocurrency, Double maxSupply, Double circulatingSupply, Double totalSupply,
			double percentChange1h, double ytdPriceChangePercentageTwd, double ytdPriceChangePercentageUsd,
			double percentChange24h, double percentChange7d, double percentChange30d, double percentChange60d,
			double percentChange90d, double twdPriceOfCryptocurrency, double twdMarketCap,
			double twdFullyDilutedMarketCap, double usdPriceOfCryptocurrency, double usdMarketCap,
			double usdFullyDilutedMarketCap, double volume24h) {
		super();
		this.date = date;
		this.nameOfCryptocurrency = nameOfCryptocurrency;
		this.symbolOfCryptocurrency = symbolOfCryptocurrency;
		this.slugOfCryptocurrency = slugOfCryptocurrency;
		this.maxSupply = maxSupply;
		this.circulatingSupply = circulatingSupply;
		this.totalSupply = totalSupply;
		this.percentChange1h = percentChange1h;
		this.ytdPriceChangePercentageTwd = ytdPriceChangePercentageTwd;
		this.ytdPriceChangePercentageUsd = ytdPriceChangePercentageUsd;
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
		this.volume24h = volume24h;
	}

	public double getVolume24h() {
		return volume24h;
	}

	public void setVolume24h(double volume24h) {
		this.volume24h = volume24h;
	}

	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
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

	public Double getMaxSupply() {
		return maxSupply;
	}

	public void setMaxSupply(Double maxSupply2) {
		this.maxSupply = maxSupply2;
	}

	public Double getCirculatingSupply() {
		return circulatingSupply;
	}

	public void setCirculatingSupply(Double circulatingSupply2) {
		this.circulatingSupply = circulatingSupply2;
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

	

}
