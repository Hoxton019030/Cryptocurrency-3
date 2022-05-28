package com.Group1.CoinShell.model.Yiwen;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="CustomizedUserAvatar")
public class CustomizedUserAvatar {

	@Id
	@Column(name="Id", columnDefinition="int")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name="UserAvatar", columnDefinition="nvarchar(MAX)")
	private String customizedUserAvatar;
	
	public CustomizedUserAvatar() {
	}

	public CustomizedUserAvatar(Integer id, String customizedUserAvatar) {
		super();
		this.id = id;
		this.customizedUserAvatar = customizedUserAvatar;
	}

	public Integer getid() {
		return id;
	}

	public void setid(Integer id) {
		this.id = id;
	}

	public String getCustomizedUserAvatar() {
		return customizedUserAvatar;
	}

	public void setCustomizedUserAvatar(String customizedUserAvatar) {
		this.customizedUserAvatar = customizedUserAvatar;
	}


}
