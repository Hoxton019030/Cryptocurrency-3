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
	
	@Column(name="price",nullable = false)
	private Integer price;
	
	@Column(name="volume",nullable = false)
	private Integer volume;
	
	@Column(name="photo",columnDefinition = "NVARCHAR(MAX)",nullable = false)
	private String photo;
	
	@Column(name="discribe",nullable = false)
	private String discribe;

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

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getVolume() {
		return volume;
	}

	public void setVolume(Integer volume) {
		this.volume = volume;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getDiscribe() {
		return discribe;
	}

	public void setDiscribe(String discribe) {
		this.discribe = discribe;
	}

	public Commodity(String commodityName, Integer price, Integer volume, String photo, String discribe) {
		this.commodityName = commodityName;
		this.price = price;
		this.volume = volume;
		this.photo = photo;
		this.discribe = discribe;
	}
	

}
