package site.servlet;

import java.io.IOException;
import java.util.Date;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.EmailUtils;
import common.PageInfo;
import common.PageType;
import common.SessionUtils;
import dao.ShareDao;
import dao.UserDao;
import domain.Email;
import model.Share;
import model.User;
import model.Video;


@WebServlet("/ShareVideo")
public class ShareVideoServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (!SessionUtils.isLogin(request)) {
			response.sendRedirect("Login");
			return;
		}
		String videoId = request.getParameter("videoId");
		
		if (videoId == null) {
			response.sendRedirect("/Homepage");
			return;
		}
		
		request.setAttribute("videoId", videoId);
		PageInfo.prepareAndForwardSite(request, response, PageType.SITE_SHARE_PAGE);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String emailAddress = request.getParameter("email");
			String videoId = request.getParameter("videoId");
			
			
			if (videoId == null) {
				request.setAttribute("error", "videoId is null");
			}else {
				Email email = new Email();
				email.setFrom("thaianhnam09@gmail.com");
				email.setFromPassword("xdbnnvrgxaprbxls");
				email.setTo(emailAddress);
				email.setSubject("Share Favorite Video");
				StringBuilder sb = new StringBuilder();
				sb.append("Dear Ms/Mr. <br> ");
				sb.append("The video is more interesting and I want to share with you <br>");
				sb.append("Please click the link ").append(String.format("<a href='http://localhost:8080/EManagement/Homepage?videoId=%s'>View Video</a><br>", videoId));
				sb.append("Regards<br>");
				sb.append("Administrator");
				
				email.setContent(sb.toString());
				EmailUtils.send(email);
				
				ShareDao sdao = new ShareDao();
				Share share = new Share();
				share.setEmails(emailAddress);
				share.setSharedDate(new Date());
				
				String username = SessionUtils.getLoginedUsername(request);
				
				User user = new User();
				user.setUsername(username);
				share.setUser(user);
				
				Video video = new Video();
				video.setVideoId(videoId);
				share.setVideo(video);
				
				sdao.insert(share);
				request.setAttribute("message", "Video link has been sent");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", e.getMessage());
		}
		PageInfo.prepareAndForwardSite(request, response, PageType.SITE_SHARE_PAGE);
	}

}
