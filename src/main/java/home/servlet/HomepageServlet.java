package home.servlet;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PageInfo;
import common.PageType;
import dao.JpaUtils;
import dao.VideoDao;
import model.Video;

/**
 * Servlet implementation class HomepageServlet
 */
@WebServlet("/Homepage")
public class HomepageServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			
			
			int pageSize = 8;
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

		catch (Exception e) {
			e.printStackTrace();

		}

		PageInfo.prepareAndForwardSite(request, response, PageType.SITE_HOME_PAGE);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
