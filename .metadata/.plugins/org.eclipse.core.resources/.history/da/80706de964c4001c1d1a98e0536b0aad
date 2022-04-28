package com.jerrymvc.springdemo.model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EmployeeDao {
	
	@Autowired
	private SessionFactory factory;
	
	public Employee insertEmp(Employee emp) {
		Session session = factory.getCurrentSession();
		
		session.save(emp);
		
		return emp;
	}

}
