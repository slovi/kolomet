package cz.kolomet.util.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

import cz.kolomet.service.exception.Ignored;

public class EnvironmentAwareMappingExceptionResolver extends SimpleMappingExceptionResolver {
	
	@Value("${env.development}")
	private Boolean envDevelopment;
	
	@Override
	protected void logException(Exception ex, HttpServletRequest request) {
		if (ex instanceof Ignored) {
			logger.warn("error: " + ex.getLocalizedMessage());
		} else {
			super.logException(ex, request);
		}
	}
	
	@Override
	protected ModelAndView getModelAndView(String viewName, Exception ex) {
		ModelAndView mav = super.getModelAndView(viewName, ex);
		mav.addObject("envDevelopment", envDevelopment);
		return mav;
	}

}
