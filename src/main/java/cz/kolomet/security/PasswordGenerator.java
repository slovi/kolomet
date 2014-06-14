package cz.kolomet.security;

import cz.kolomet.domain.ApplicationUser;

public interface PasswordGenerator {

	public String generatePassword(ApplicationUser applicationUser);
	
}
