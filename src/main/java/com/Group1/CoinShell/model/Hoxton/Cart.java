package com.Group1.CoinShell.model.Hoxton;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.Group1.CoinShell.model.Yiwen.Members;
@Entity
@Table(name="cart")
public class Cart {

	@Id
	@Column(name = "id", columnDefinition = "int")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "member_id",nullable = false)
	private Integer memberId;
	

	@Column(name = "commodidy1")
	private Integer commodidy1;

	@Column(name = "commodidy2")
	private Integer commodidy2;
	
	@Column(name = "commodidy3")
	private Integer commodidy3;
	
	@Column(name = "commodidy4")
	private Integer commodidy4;
	
	@Column(name = "commodidy5")
	private Integer commodidy5;
	
	@Column(name = "commodidy6")
	private Integer commodidy6;
	
	@Column(name = "commodidy7")
	private Integer commodidy7;
	
	@Column(name = "commodidy8")
	private Integer commodidy8;
	
	@Column(name = "commodidy9")
	private Integer commodidy9;
	
	@Column(name = "commodidy10")
	private Integer commodidy10;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public Integer getCommodidy1() {
		return commodidy1;
	}

	public void setCommodidy1(Integer commodidy1) {
		this.commodidy1 = commodidy1;
	}

	public Integer getCommodidy2() {
		return commodidy2;
	}

	public void setCommodidy2(Integer commodidy2) {
		this.commodidy2 = commodidy2;
	}

	public Integer getCommodidy3() {
		return commodidy3;
	}

	public void setCommodidy3(Integer commodidy3) {
		this.commodidy3 = commodidy3;
	}

	public Integer getCommodidy4() {
		return commodidy4;
	}

	public void setCommodidy4(Integer commodidy4) {
		this.commodidy4 = commodidy4;
	}

	public Integer getCommodidy5() {
		return commodidy5;
	}

	public void setCommodidy5(Integer commodidy5) {
		this.commodidy5 = commodidy5;
	}

	public Integer getCommodidy6() {
		return commodidy6;
	}

	public void setCommodidy6(Integer commodidy6) {
		this.commodidy6 = commodidy6;
	}

	public Integer getCommodidy7() {
		return commodidy7;
	}

	public void setCommodidy7(Integer commodidy7) {
		this.commodidy7 = commodidy7;
	}

	public Integer getCommodidy8() {
		return commodidy8;
	}

	public void setCommodidy8(Integer commodidy8) {
		this.commodidy8 = commodidy8;
	}

	public Integer getCommodidy9() {
		return commodidy9;
	}

	public void setCommodidy9(Integer commodidy9) {
		this.commodidy9 = commodidy9;
	}

	public Integer getCommodidy10() {
		return commodidy10;
	}

	public void setCommodidy10(Integer commodidy10) {
		this.commodidy10 = commodidy10;
	}

	public Cart(Integer memberId, Integer commodidy1, Integer commodidy2, Integer commodidy3,
			Integer commodidy4, Integer commodidy5, Integer commodidy6, Integer commodidy7, Integer commodidy8,
			Integer commodidy9, Integer commodidy10) {
		this.memberId = memberId;
		this.commodidy1 = commodidy1;
		this.commodidy2 = commodidy2;
		this.commodidy3 = commodidy3;
		this.commodidy4 = commodidy4;
		this.commodidy5 = commodidy5;
		this.commodidy6 = commodidy6;
		this.commodidy7 = commodidy7;
		this.commodidy8 = commodidy8;
		this.commodidy9 = commodidy9;
		this.commodidy10 = commodidy10;
	}

	
}
