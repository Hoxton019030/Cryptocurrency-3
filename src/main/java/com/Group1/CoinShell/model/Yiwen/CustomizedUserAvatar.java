package com.Group1.CoinShell.model.Yiwen;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="CustomizedUserAvatar")
public class CustomizedUserAvatar {

	@Id
	@Column(name="Id", columnDefinition="int")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer AvatarId;
	
	private String customizedUserAvatar;
	
	public CustomizedUserAvatar() {
	}

}
