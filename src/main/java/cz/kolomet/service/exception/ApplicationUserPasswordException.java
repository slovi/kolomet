package cz.kolomet.service.exception;

public class ApplicationUserPasswordException extends ServiceExpcetion {

	public ApplicationUserPasswordException(String message) {
		super(message, "exception_bad_password");
	}
	
	public ApplicationUserPasswordException(String message, String code) {
		super(message, code);
	}

}
