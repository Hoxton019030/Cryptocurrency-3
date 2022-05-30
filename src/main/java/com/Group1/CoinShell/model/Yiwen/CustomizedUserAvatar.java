package com.Group1.CoinShell.model.Yiwen;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="customizedUserAvatar")
public class CustomizedUserAvatar {

	@Id
	@Column(name="id", columnDefinition="int")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name="userAvatarBase64", columnDefinition="nvarchar(MAX)")
	private String userAvatarBase64;
	
	@Column(name="aliasAvatar", columnDefinition="nvarchar(20)")
	private String aliasAvatar;
	
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "member_id")
	private Members members;
	
	public CustomizedUserAvatar() {
	}

	public CustomizedUserAvatar(Integer id, String userAvatarBase64, String aliasAvatar) {
		super();
		this.id = id;
		this.userAvatarBase64 = userAvatarBase64;
		this.aliasAvatar = aliasAvatar;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserAvatarBase64() {
		return userAvatarBase64;
	}

	public void setUserAvatarBase64(String userAvatarBase64) {
		this.userAvatarBase64 = userAvatarBase64;
	}

	public String getAliasAvatar() {
		return aliasAvatar;
	}

	public void setAliasAvatar(String aliasAvatar) {
		this.aliasAvatar = aliasAvatar;
	}

}
