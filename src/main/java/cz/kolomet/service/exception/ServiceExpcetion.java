package cz.kolomet.service.exception;

public class ServiceExpcetion extends RuntimeException {
	
	private final String code;
	
	public ServiceExpcetion(String message, String code) {
		super(message);
		this.code = code;
	}
	
	public ServiceExpcetion(String message, Exception cause, String code) {
		super(message, cause);
		this.code = code;
	}

	public String getCode() {
		return code;
	}

}
