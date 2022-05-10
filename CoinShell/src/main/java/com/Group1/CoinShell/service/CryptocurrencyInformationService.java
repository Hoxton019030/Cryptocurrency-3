package com.Group1.CoinShell.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.Group1.CoinShell.model.Cryptocurrency;
import com.Group1.CoinShell.model.CryptocurryencyDao;

@Service
@Transactional
public class CryptocurrencyInformationService {

	@Autowired
	private CryptocurryencyDao dao;


//	public List<Cryptocurrency> findLastestCurrencyInformation(String currencyName) {
//		return dao.findLastestCurrencyInformation(currencyName);
//	}

}
