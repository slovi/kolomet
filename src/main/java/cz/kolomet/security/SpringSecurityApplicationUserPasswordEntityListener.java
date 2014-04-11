package cz.kolomet.security;

import javax.persistence.PreUpdate;

import org.apache.commons.lang3.StringUtils;

import cz.kolomet.domain.ApplicationUser;

public class SpringSecurityApplicationUserPasswordEntityListener {
	
	@PreUpdate
	public void touchForUpdate(Object entity) {
		if (entity instanceof ApplicationUser) {
			ApplicationUser applicationUser = (ApplicationUser) entity;
			if (StringUtils.isEmpty(applicationUser.getPassword())) {
				applicationUser.setPassword(ApplicationUserDetails.getActualApplicationUserDetails().getPassword());
			}
		}
	}

}
