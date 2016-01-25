package com.mercury.dao;

import com.mercury.beans.User;
import com.mercury.utils.JdbcUtil;

import java.util.List;


import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

public class PersonDaoImpl implements PersonDao {
	private JdbcUtil util;
	
	public PersonDaoImpl() {
		if (util==null) {
			util = new JdbcUtil();
		}
	}
	
	private HibernateTemplate template;
	public void setSessionFactory (SessionFactory sessionFactory) {
		template = new HibernateTemplate (sessionFactory);
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public User findPersonByEmail(String email) {
		// TODO Auto-generated method stub
/*		String sql = "select u.email, u.password, u.role, r.authority from users u, user_roles r where u.role = r.user_role_id and email=?";
		User user = new User();
		try {
			Connection conn = util.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email.toLowerCase());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				UserRole ur = new UserRole(rs.getInt("role"), rs.getString("Authority"));
				user.setRole(ur);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
*/

		
		System.out.println(email);
		String hql = "from User u where u.email=:email";
		
		List <User> list = template.findByNamedParam(hql,"email",email);
		System.out.println(2);
		User user = list.get(0);
		System.out.println(user);
		return user;
	}


	@Override
	public void addPerson(User user) {
		// TODO Auto-generated method stub
		System.out.println(user);
		template.save(user);
	}


	@SuppressWarnings("unchecked")
	@Override
	public User activeUser(String activation) {
		// TODO Auto-generated method stub
		String hql = "from User u where u.activation = :activation";
		List <User> list = template.findByNamedParam(hql, "activation", activation);
		if (list.size() == 0) {
			return null;
		} 
		return list.get(0);
	}


	@SuppressWarnings("unchecked")
	@Override
	public int checkActivationCode(String activation) {
		// TODO Auto-generated method stub
		String hql = "select count(*) from User u where u.activation = :activation";
		List <Long> list = template.findByNamedParam(hql, "activation", activation);
		long count = list.get(0);
		return (int) count;
	}


	@Override
	public void updatePerson(User user) {
		// TODO Auto-generated method stub
		template.update(user);
	}


	@SuppressWarnings("unchecked")
	@Override
	public int countUser() {
		// TODO Auto-generated method stub
		String hql = "select count(*) from User u";
		List <Long> list = template.find(hql);
		long count = list.get(0);
		return (int) count;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public int countActivedUser() {
		// TODO Auto-generated method stub
		String hql = "select count(*) from User u where u.enable = true";
		List <Long> list = template.find(hql);
		long count = list.get(0);
		return (int) count;
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<User> findAllUser() {
		// TODO Auto-generated method stub
		String hql = "from User";
		List<User> list = template.find(hql);
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public User findPersonByPassword(String md5){
		// TODO Auto-generated method stub
		String hql = "from User u where u.password=:md5";
		
		List <User> list = template.findByNamedParam(hql,"md5",md5);
		System.out.println(2);
		User user = list.get(0);
		System.out.println(user);
		return user;
	}
}
