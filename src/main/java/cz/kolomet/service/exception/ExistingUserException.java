package cz.kolomet.service.exception;

import cz.kolomet.domain.ApplicationUser;

public class ExistingUserException extends ServiceExpcetion {
	
	private final ApplicationUser applicationUser;
	
	public ExistingUserException(ApplicationUser applicationUser) {
		super("User with username " + applicationUser.getUsername() + " already exists.", "exception_bad_username");
		this.applicationUser = applicationUser;
	}

	public ApplicationUser getApplicationUser() {
		return applicationUser;
	}

}
