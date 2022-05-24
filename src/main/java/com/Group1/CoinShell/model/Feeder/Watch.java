package com.Group1.CoinShell.model.Feeder;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.Group1.CoinShell.model.Yiwen.Members;

@Entity 
@Table(name="watch")
public class Watch {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "watch_id")
	private Integer watchId;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="fk_member_id")
	private Members members;
	
	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	@JoinColumn(name = "fk_coin_id")
	private Coin coin;
	
//	@ManyToMany(fetch = FetchType.LAZY,cascade = CascadeType.ALL)
//	@JoinTable(name = "coin_watch",
//	joinColumns = {@JoinColumn(name="fk_watch_id",referencedColumnName = "watch_id")},
//	inverseJoinColumns = {@JoinColumn(name="fk_id",referencedColumnName = "id")}
//			)
//	private Set<Coin> coin = new HashSet<Coin>();
	
	public Watch() {
	}

	@Override
	public String toString() {
		return "Watch [watchId=" + watchId + ", members=" + members + ", coin=" + coin + "]";
	}

	public Integer getWatchId() {
		return watchId;
	}

	public void setWatchId(Integer watchId) {
		this.watchId = watchId;
	}

	public Members getMembers() {
		return members;
	}

	public void setMembers(Members members) {
		this.members = members;
	}

	public Coin getCoin() {
		return coin;
	}

	public void setCoin(Coin coin) {
		this.coin = coin;
	}

}