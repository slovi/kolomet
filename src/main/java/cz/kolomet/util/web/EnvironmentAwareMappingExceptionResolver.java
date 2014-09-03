package cz.kolomet.util.web;

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

}
