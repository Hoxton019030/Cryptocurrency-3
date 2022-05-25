package com.Group1.CoinShell.model.Feeder;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface WatchDao extends JpaRepository<Watch, Integer> {

}
