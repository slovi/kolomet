package cz.kolomet.util.web.ajax;

public class AjaxError {
	
	public static int ERROR_FILE_UPLOAD_CODE = 1000;
	
	private final int errorCode;
	
	private final String errorDescription;

	public AjaxError(int errorCode, String errorDescription) {
		this.errorCode = errorCode;
		this.errorDescription = errorDescription;
	}

	public int getErrorCode() {
		return errorCode;
	}

	public String getErrorDescription() {
		return errorDescription;
	}

}
