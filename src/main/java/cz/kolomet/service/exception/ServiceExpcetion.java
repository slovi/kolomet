package cz.kolomet.service.exception;

public class ServiceExpcetion extends RuntimeException {
	
	private final String code;
	
	private final Object[] arguments;
	
	public ServiceExpcetion(String message, String code) {
		this(message, code, (Object[]) null);
	}
	
	public ServiceExpcetion(String message, Exception cause, String code) {
		this(message, cause, code, (Object[]) null);
	}
	
	public ServiceExpcetion(String message, String code, Object argument) {
		this(message, code, new Object[] {argument});
	}
	
	public ServiceExpcetion(String message, Exception cause, String code, Object argument) {
		this(message, cause, code, new Object[] {argument});
	}
	
	public ServiceExpcetion(String message, String code, Object[] arguments) {
		super(message);
		this.code = code;
		this.arguments = arguments;
	}
	
	public ServiceExpcetion(String message, Exception cause, String code, Object[] arguments) {
		super(message, cause);
		this.code = code;
		this.arguments = arguments;
	}

	public String getCode() {
		return code;
	}

	public Object[] getArguments() {
		return arguments;
	}

}
