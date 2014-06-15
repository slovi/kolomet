package cz.kolomet.domain.security;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.test.context.TestContext;
import org.springframework.test.context.support.AbstractTestExecutionListener;

public class SecurityContextTestExecutionListener extends AbstractTestExecutionListener {
	
	@Override
	public void beforeTestMethod(TestContext testContext) throws Exception {
		
		SecurityContext securityContext = SecurityContextHolder.createEmptyContext();
		securityContext.setAuthentication(new UsernamePasswordAuthenticationToken("test", "test"));
		SecurityContextHolder.setContext(securityContext);
	}
	
	@Override
	public void afterTestMethod(TestContext testContext) throws Exception {
		SecurityContextHolder.clearContext();
	}
	
}
