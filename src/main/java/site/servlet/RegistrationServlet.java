package site.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import common.PageInfo;
import common.PageType;
import dao.UserDao;
import model.User;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/Registration")
public class RegistrationServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PageInfo.prepareAndForwardSite(request, response, PageType.SITE_REGISTRATION_PAGE);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User();
		try {
			
			BeanUtils.populate(user, request.getParameterMap());
			user.setAdmin(false);
			UserDao dao = new UserDao();
			dao.insert(user);
			PageInfo.prepareAndForwardSite(request, response, PageType.SITE_LOGIN_PAGE);
			return;
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", e.getMessage());
		}
		request.setAttribute("user", user);
		PageInfo.prepareAndForwardSite(request, response, PageType.SITE_REGISTRATION_PAGE);
	}

}
