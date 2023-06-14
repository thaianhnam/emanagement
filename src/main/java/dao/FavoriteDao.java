package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import domain.FavoriteReport;
import domain.FavoriteUserReport;
import model.Favorite;

public class FavoriteDao extends AbstractEntityDao<Favorite> {

	public FavoriteDao() {
		super(Favorite.class);
	}
	
	public List<FavoriteUserReport> reportFavoriteUsersByVideo(String videoId) {
		String jpql = "select new domain.FavoriteUserReport(f.user.username, f.user.fullname, f.user.email, f.likedDate) "
				+ " from Favorite f where f.video.videoId = :videoId ";
		EntityManager em = JpaUtils.getEntityManager();
		List<FavoriteUserReport> list = null;
		try {
			TypedQuery<FavoriteUserReport> query = em.createQuery(jpql, FavoriteUserReport.class);
			query.setParameter("videoId", videoId);
			list = query.getResultList();
		} finally {
			em.close();
		} 
		return list;
	}

	public List<FavoriteReport> reportFavoritesByVideos() {
		String jpql = "select new domain.FavoriteReport(f.video.title, count(f),min(f.likedDate),max(f.likedDate)) "
				+ " from Favorite f group by f.video.title ";
		EntityManager em = JpaUtils.getEntityManager();
		List<FavoriteReport> list = null;
		try {
			TypedQuery<FavoriteReport> query = em.createQuery(jpql, FavoriteReport.class);
			list = query.getResultList();
		} finally {
			em.close();
		} 
		return list;
	}
	
	
	
}
