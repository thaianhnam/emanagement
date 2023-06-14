package dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import model.User;

public class UserDao extends AbstractEntityDao<User> {

	public UserDao() {
		super(User.class);
	}

	public void changePassword(String username, String oldPassword, String newPassword)
			throws Exception {
		EntityManager em = JpaUtils.getEntityManager();

		EntityTransaction trans = em.getTransaction();

		String jpql = "select u from User u where u.username = :username and u.password = :password";

		try {
			trans.begin();
			TypedQuery<User> query = em.createQuery(jpql, User.class);
			query.setParameter("username", username);
			query.setParameter("password", oldPassword);

			User user = query.getSingleResult();
			
			if (user != null) {
				user.setPassword(newPassword);
				em.merge(user);
				trans.commit();
			}


		} catch (NoResultException e) {
		    
		    throw new Exception("Current password or Username are incorrect");
		}
		catch (Exception e) {
			trans.rollback();
			throw e;
		} finally {
			em.close();
		}
	}

	public User findByUsernameAndEmail(String username, String email) {
		EntityManager em = JpaUtils.getEntityManager();
		String jpql = "select u from User u where u.username=:username and u.email=:email";
		try {
			TypedQuery<User> query = em.createQuery(jpql, User.class);
			query.setParameter("username", username);
			query.setParameter("email", email);
			User user = query.getSingleResult();
			return user;
		} finally {
			em.close();
		}
		
	}
}
