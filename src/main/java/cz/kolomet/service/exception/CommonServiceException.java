package cz.kolomet.service.exception;

public class CommonServiceException extends RuntimeException {

	public static int FILE_NOT_SUPPORTED_FORMAT = 100;
	
	private final Integer errorNr;
	
	public CommonServiceException(Integer errorNr) {
		super();
		this.errorNr = errorNr;
	}

	public CommonServiceException(String message, Throwable cause, Integer errorNr) {
		super(message, cause);
		this.errorNr = errorNr;
	}

	public CommonServiceException(String message, Integer errorNr) {
		super(message);
		this.errorNr = errorNr;
	}

	public CommonServiceException(Throwable cause, Integer errorNr) {
		super(cause);
		this.errorNr = errorNr;
	}

	public Integer getErrorNr() {
		return errorNr;
	}

}
