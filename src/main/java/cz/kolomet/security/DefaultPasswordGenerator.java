package cz.kolomet.security;

import org.apache.commons.lang.RandomStringUtils;

import cz.kolomet.domain.ApplicationUser;

public class DefaultPasswordGenerator implements PasswordGenerator {

	@Override
	public String generatePassword(ApplicationUser applicationUser) {
		return RandomStringUtils.randomAlphanumeric(6);
	}

}
