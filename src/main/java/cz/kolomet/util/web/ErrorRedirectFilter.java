package cz.kolomet.util.web;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ErrorRedirectFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest servletRequest = (HttpServletRequest) request;
		HttpServletResponse servletResponse = (HttpServletResponse) response;
		
		try {
			chain.doFilter(request, response);
		} catch (Exception e) { 
			RequestDispatcher dispatcher = request.getRequestDispatcher(servletRequest.getContextPath() + "/" + servletRequest.getServletPath() + "/public/uncaughtException");
			dispatcher.forward(servletRequest, servletResponse);
		} finally {
			if (servletResponse.getStatus() == HttpServletResponse.SC_NOT_FOUND) {
				RequestDispatcher dispatcher = request.getRequestDispatcher(servletRequest.getContextPath() + "/" + servletRequest.getServletPath() + "/public/resourceNotFound");
				dispatcher.forward(servletRequest, servletResponse);
			}
		}
		
	}

	@Override
	public void destroy() {
	}

}
