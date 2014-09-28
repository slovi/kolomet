package cz.kolomet.service.exception;

public class IgnorableCommonServiceException extends CommonServiceException implements Ignored {

	public IgnorableCommonServiceException(Integer errorNr) {
		super(errorNr);
	}

	public IgnorableCommonServiceException(String message, Integer errorNr) {
		super(message, errorNr);
	}

	public IgnorableCommonServiceException(String message, Throwable cause, Integer errorNr) {
		super(message, cause, errorNr);
	}

	public IgnorableCommonServiceException(Throwable cause, Integer errorNr) {
		super(cause, errorNr);
	}

}
