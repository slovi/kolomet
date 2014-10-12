package cz.kolomet.security;

import java.io.Serializable;

import org.springframework.security.access.PermissionEvaluator;
import org.springframework.security.core.Authentication;

import cz.kolomet.domain.ApplicationUser;
import cz.kolomet.domain.Seller;

public class KolometPermissionEveluator implements PermissionEvaluator {

	@Override
	public boolean hasPermission(Authentication authentication, Object targetDomainObject, Object permission) {
		ApplicationUserDetails details = (ApplicationUserDetails) authentication.getPrincipal();		
		if (targetDomainObject instanceof Seller) {
			if (details.isSellersAll()) {
				return true;
			} else {
				return ((Seller) targetDomainObject).getId().equals(details.getSellerId());
			}
		}
		if (targetDomainObject instanceof ApplicationUser) {
			return ((ApplicationUser) targetDomainObject).getId().equals(details.getUserId());
		}
		return false;
	}

	@Override
	public boolean hasPermission(Authentication authentication, Serializable targetId, String targetType, Object permission) {
		return false;
	}

}
