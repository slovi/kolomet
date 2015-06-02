package cz.kolomet.util.web;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.js.ajax.AjaxHandler;
import org.springframework.js.ajax.SpringJavascriptAjaxHandler;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.AbstractView;
import org.springframework.web.servlet.view.InternalResourceView;
import org.springframework.web.servlet.view.RedirectView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

public class KolometViewResolver extends UrlBasedViewResolver {
	
	@Override
	protected Object getCacheKey(String viewName, Locale locale) {
		String cacheKey = (String) super.getCacheKey(viewName, locale);
		return appendServletPath(cacheKey);
	}
	
	@Override
	protected View createView(String viewName, Locale locale) throws Exception {
		// If this resolver is not supposed to handle the given view,
		// return null to pass on to the next resolver in the chain.
		
		if (!canHandle(viewName, locale)) {
			return null;
		}
		// Check for special "redirect:" prefix.
		if (viewName.startsWith(REDIRECT_URL_PREFIX)) {
			String redirectUrl = viewName.substring(REDIRECT_URL_PREFIX.length());
			String resultRedirectUrl = appendServletPath(redirectUrl);
			RedirectView view = new AjaxRedirectView(resultRedirectUrl, isRedirectContextRelative(), isRedirectHttp10Compatible());
			view.setExposeModelAttributes(false);
			return applyLifecycleMethods(viewName, view);
		}
		// Check for special "forward:" prefix.
		if (viewName.startsWith(FORWARD_URL_PREFIX)) {
			String forwardUrl = viewName.substring(FORWARD_URL_PREFIX.length());
			String resultForwardUrl = appendServletPath(forwardUrl);
			return new InternalResourceView(resultForwardUrl);
		}
		// Else fall back to superclass implementation: calling loadView - need to strip first slash.
		View view = super.createView(appendServletPath(viewName).substring(1), locale);
		if (view != null) {
			return view;
		} else {
			return null;
		}
	}
	
	private String appendServletPath(String url) {

		RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
		if (requestAttributes instanceof ServletRequestAttributes) {
			return ((ServletRequestAttributes) requestAttributes).getRequest().getServletPath() + "/" + url;
		} else {
			throw new IllegalStateException("Cannot resolve view - request is not performed by http protocol.");
		}
	}

	private View applyLifecycleMethods(String viewName, AbstractView view) {
		return (View) getApplicationContext().getAutowireCapableBeanFactory().initializeBean(view, viewName);
	}
	
	private class AjaxRedirectView extends RedirectView implements View {

		private AjaxHandler ajaxHandler = new SpringJavascriptAjaxHandler();

		public AjaxRedirectView(String redirectUrl, boolean redirectContextRelative, boolean redirectHttp10Compatible) {
			super(redirectUrl, redirectContextRelative, redirectHttp10Compatible);
		}

		protected void sendRedirect(HttpServletRequest request, HttpServletResponse response, String targetUrl,
				boolean http10Compatible) throws IOException {
			if (ajaxHandler.isAjaxRequest(request, response)) {
				ajaxHandler.sendAjaxRedirect(targetUrl, request, response, false);
			} else {
				super.sendRedirect(request, response, targetUrl, http10Compatible);
			}
		}

	}

}
