package cz.kolomet.util.web.ajax;

public class AjaxResponse {

	private final boolean successful;
	
	private final AjaxError ajaxError;
	
	private final Object ajaxContent;
	
	protected AjaxResponse() {
		this(null, null);
	}
	
	protected AjaxResponse(Object ajaxContent) {
		this(ajaxContent, null);
	}
	
	protected AjaxResponse(Object ajaxContent, int error, Exception e) {
		this.ajaxContent = ajaxContent;
		this.ajaxError = new AjaxError(error, e.getLocalizedMessage());
		this.successful = false;
	}
	
	protected AjaxResponse(Object ajaxContent, AjaxError ajaxError) {
		this.ajaxContent = ajaxContent;
		this.ajaxError = ajaxError;
		this.successful = ajaxError == null ? true : false;
	}
	
	public static AjaxResponse successful(Object result) {
		return new AjaxResponse(result);
	}
	
	public static AjaxResponse emptySuccessul() {
		return new AjaxResponse();
	}
	
	public static AjaxResponse error(int errorCode, Exception e) {
		return new AjaxResponse(false, errorCode, e);
	}

	public AjaxError getAjaxError() {
		return ajaxError;
	}

	public Object getAjaxContent() {
		return ajaxContent;
	}

	public boolean isSuccessful() {
		return successful;
	}
	
}
