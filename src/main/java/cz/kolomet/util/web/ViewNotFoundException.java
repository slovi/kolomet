package cz.kolomet.util.web;

public class ViewNotFoundException extends RuntimeException {
	
	public ViewNotFoundException(String message, Throwable cause) {
		super(message, cause);
	}

	public ViewNotFoundException(String message) {
		super(message);
	}

	public ViewNotFoundException(Throwable cause) {
		super(cause);
	}

}
