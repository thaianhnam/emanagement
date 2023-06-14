package domain;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.servlet.http.HttpServletRequest;

import dao.JpaUtils;
import model.Video;

public class Page {
	public void Page(HttpServletRequest request) {
		int pageSize = 6;
	    int pageNumber = Integer.parseInt(request.getParameter("page") != null ? request.getParameter("page") : "1");
	    
	    EntityManager em = JpaUtils.getEntityManager();
	    TypedQuery<Video> videoQuery = em.createQuery("SELECT s FROM Video s", Video.class);
	    int totalVideo = videoQuery.getResultList().size();

	    int totalPages = (int) Math.ceil((double) totalVideo / pageSize);

	    int previousPage = Math.max(1, pageNumber - 1);
	    int nextPage = Math.min(totalPages, pageNumber + 1);

	    int offset = (pageNumber - 1) * pageSize;

	    TypedQuery<Video> query = em.createQuery("SELECT s FROM Video s", Video.class);
	    query.setFirstResult(offset);
	    query.setMaxResults(pageSize);
	    List<Video> videos = query.getResultList();

	    request.setAttribute("videos", videos);
	    request.setAttribute("previousPage", previousPage);
	    request.setAttribute("nextPage", nextPage);
	}
	
}
