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
	private Integer avatarId;
	
	@Column(name="UserAvatar", columnDefinition="nvarchar(MAX)")
	private String customizedUserAvatar;
	
	public CustomizedUserAvatar() {
	}

	public CustomizedUserAvatar(Integer avatarId, String customizedUserAvatar) {
		super();
		this.avatarId = avatarId;
		this.customizedUserAvatar = customizedUserAvatar;
	}

	public Integer getAvatarId() {
		return avatarId;
	}

	public void setAvatarId(Integer avatarId) {
		this.avatarId = avatarId;
	}

	public String getCustomizedUserAvatar() {
		return customizedUserAvatar;
	}

	public void setCustomizedUserAvatar(String customizedUserAvatar) {
		this.customizedUserAvatar = customizedUserAvatar;
	}


}
