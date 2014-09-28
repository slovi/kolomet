package cz.kolomet.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

public class KolometLogoutSuccessHandler implements LogoutSuccessHandler {

	@Override
	public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		
		String source = request.getParameter("source");
		if ("tour".equals(source)) {
			response.sendRedirect(request.getContextPath() + "/tour/public/places");
		} else {
			response.sendRedirect(request.getContextPath() + "/store/public/intro/index");
		}
		
	}

}
