package cz.kolomet.service.exception;

public class UserNotFoundException extends ServiceExpcetion {
	
	private final String username;
	
	public UserNotFoundException(String username) {
		super("User with username " + username + " not found.", "user_not_foud");
		this.username = username;
	}

	public String getUsername() {
		return username;
	}

}
