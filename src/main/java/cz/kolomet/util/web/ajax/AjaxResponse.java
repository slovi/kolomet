package cz.kolomet.util.web.ajax;

public class AjaxResponse {

	private final AjaxError ajaxError;
	
	private final Object ajaxContent;
	
	public AjaxResponse(Object ajaxContent) {
		this(ajaxContent, null);
	}
	
	public AjaxResponse(Object ajaxContent, AjaxError ajaxError) {
		this.ajaxContent = ajaxContent;
		this.ajaxError = ajaxError;
	}

	public AjaxError getAjaxError() {
		return ajaxError;
	}

	public Object getAjaxContent() {
		return ajaxContent;
	}
	
}
