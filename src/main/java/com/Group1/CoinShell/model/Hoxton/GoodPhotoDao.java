package com.Group1.CoinShell.model.Hoxton;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GoodPhotoDao {
	
	@Autowired
	private SessionFactory factory;
	
	public GoodPhoto saveGoodPhoto(GoodPhoto gp) {
		Session session = factory.getCurrentSession();
		session.save(gp);
		
		return gp;
	}
	
	public List<GoodPhoto> getAllPhoto(){
		Session session = factory.getCurrentSession();
		Query<GoodPhoto> query = session.createQuery("from GoodPhoto", GoodPhoto.class);
		return query.getResultList();
	}
	
	public GoodPhoto getPhotoById(Integer id) {
		Session session = factory.getCurrentSession();
		GoodPhoto gp = session.get(GoodPhoto.class, id);
		return gp;
	}

}
