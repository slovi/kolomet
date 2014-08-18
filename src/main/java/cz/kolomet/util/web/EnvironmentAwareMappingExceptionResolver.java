package cz.kolomet.util.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

public class EnvironmentAwareMappingExceptionResolver extends SimpleMappingExceptionResolver {
	
	@Value("${env.development}")
	private Boolean envDevelopment;
	
	@Override
	protected ModelAndView getModelAndView(String viewName, Exception ex) {
		ModelAndView mav = super.getModelAndView(viewName, ex);
		mav.addObject("envDevelopment", envDevelopment);
		return mav;
	}
	
	protected String determineViewName(Exception ex, HttpServletRequest request) {
		String viewName = super.determineViewName(ex, request);
		return request.getServletPath() + "/" + viewName;
	}

}
