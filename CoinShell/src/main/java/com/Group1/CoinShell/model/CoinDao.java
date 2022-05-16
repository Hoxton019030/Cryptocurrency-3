package com.Group1.CoinShell.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CoinDao extends JpaRepository<Coin, Integer> {

}
