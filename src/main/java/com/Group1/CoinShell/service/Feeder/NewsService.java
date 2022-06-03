package com.Group1.CoinShell.service.Feeder;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.Group1.CoinShell.model.Feeder.News;
import com.Group1.CoinShell.model.Feeder.NewsDao;

@Service
@Transactional
public class NewsService {

	@Autowired
	private NewsDao newsdao;
	
	public void save(News news) {
		newsdao.save(news);
	}
	
	public List<News> findAll() {
		return newsdao.findAll();
	}
	
	//型態為List<News>
	public List<News> findByNewsId(Integer id) {
		return newsdao.findByNewsId(id);
	}
}
