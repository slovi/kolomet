package cz.kolomet.service.exception;

public class TokenNotFoundException extends RuntimeException {

	public TokenNotFoundException() {
		super();
	}

	public TokenNotFoundException(String message, Throwable cause) {
		super(message, cause);
	}

	public TokenNotFoundException(String message) {
		super(message);
	}

	public TokenNotFoundException(Throwable cause) {
		super(cause);
	}

}
