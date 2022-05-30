package com.Group1.CoinShell.model.Feeder;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonProperty;

@Component
public class StarDTO {
	
	@JsonProperty("memId")
	private Integer memId;
	@JsonProperty("coinId")
	private Integer coinId;
	
	public Integer getMemId() {
		return memId;
	}
	public void setMemId(Integer memId) {
		this.memId = memId;
	}
	public Integer getCoinId() {
		return coinId;
	}
	public void setCoinId(Integer coinId) {
		this.coinId = coinId;
	}
	

	
	

}
