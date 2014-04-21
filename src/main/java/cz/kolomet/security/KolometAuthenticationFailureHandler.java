package cz.kolomet.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.MessageSource;
import org.springframework.context.MessageSourceAware;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.security.authentication.AccountStatusException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class KolometAuthenticationFailureHandler implements AuthenticationFailureHandler, MessageSourceAware {

	protected final Log logger = LogFactory.getLog(getClass());
	
	private MessageSourceAccessor messages;
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		String text = null;
		
		if (exception instanceof BadCredentialsException) {
			text = this.messages.getMessage("security_login_fail_badcredentials");
		}
		
		if (exception instanceof UsernameNotFoundException) {
			text = this.messages.getMessage("security_login_fail_usernamenotfound");
		}
		
		if (exception instanceof AccountStatusException) {
			text = this.messages.getMessage("security_login_fail_accountstatus");
		}
		
		if (StringUtils.isEmpty(text)) {
			text = this.messages.getMessage("security_login_fail_unexpected");
			logger.error(exception, exception);
		}
		response.getOutputStream().write(text.getBytes());
	}
	
	@Override
	public void setMessageSource(MessageSource messageSource) {
		this.messages = new MessageSourceAccessor(messageSource);
	}

}