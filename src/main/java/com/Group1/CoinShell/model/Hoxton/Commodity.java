package com.Group1.CoinShell.model.Hoxton;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="commodity")
public class Commodity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;
	
	@Column(name="commodity_name",nullable = false)
	private String commodityName;
	
	@Column(name="coin",nullable = false)
	private Integer coin;
	
	@Column(name="myshell",nullable = false)
	private Integer myShell;
	
	@Column(name="volume",nullable = false)
	private Integer volume;
	
	@Column(name="photo",columnDefinition = "VARBINARY(MAX)",nullable = false)
	private byte[] photo;
	
	@Column(name="describe",nullable = false)
	private String describe;
	
	@Column(name="shell_or_coin",nullable = false)
	private String shellOrCoin;

	public Commodity(Integer id, String commodityName, Integer coin, Integer myShell, Integer volume, byte[] photo,
			String describe, String shellOrCoin) {
		super();
		this.id = id;
		this.commodityName = commodityName;
		this.coin = coin;
		this.myShell = myShell;
		this.volume = volume;
		this.photo = photo;
		this.describe = describe;
		this.shellOrCoin = shellOrCoin;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCommodityName() {
		return commodityName;
	}

	public void setCommodityName(String commodityName) {
		this.commodityName = commodityName;
	}

	public Integer getCoin() {
		return coin;
	}

	public void setCoin(Integer coin) {
		this.coin = coin;
	}

	public Integer getMyShell() {
		return myShell;
	}

	public void setMyShell(Integer myShell) {
		this.myShell = myShell;
	}

	public Integer getVolume() {
		return volume;
	}

	public void setVolume(Integer volume) {
		this.volume = volume;
	}

	public byte[] getPhoto() {
		return photo;
	}

	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}

	public String getDiscribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public String getShellOrCoin() {
		return shellOrCoin;
	}

	public void setShellOrCoin(String shellOrCoin) {
		this.shellOrCoin = shellOrCoin;
	}

	public Commodity() {
		// TODO Auto-generated constructor stub
	}
	
	
	

	

	
}
