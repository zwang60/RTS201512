package com.mercury.utils;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class HibernateUtil {
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		try {
			this.sessionFactory = sessionFactory;
		}
		catch (Exception e) {
			throw new RuntimeException(e.getMessage(), e);
		}
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	
	private final ThreadLocal<Session> SESSION = new ThreadLocal <Session>() {
		@Override
		protected Session initialValue () {
			return sessionFactory.openSession();
		}
		
	};
	
	public Session currentSession() throws HibernateException {
		Session s  = SESSION.get();
		if (s==null) {
			s = sessionFactory.openSession();
			SESSION.set(s);
		}
		return s;
	}
	
	public void closeSession() throws HibernateException {
		Session s = SESSION.get();
		SESSION.set(null);
		if (s!=null) s.close();
	}
}
