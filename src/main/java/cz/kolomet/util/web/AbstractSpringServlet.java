package cz.kolomet.util.web;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

public abstract class AbstractSpringServlet extends HttpServlet {
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		init(WebApplicationContextUtils.getRequiredWebApplicationContext(config.getServletContext()));
	}
	
	protected abstract void init(ApplicationContext applicationContext);

}
