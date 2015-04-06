package cz.kolomet.util.web.ajax;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.js.ajax.tiles2.AjaxTilesView;

public class AjaxModelAwareTilesView extends AjaxTilesView {

	@Override
	@SuppressWarnings("rawtypes")
	protected void renderMergedOutputModel(Map model, HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		super.renderMergedOutputModel(model, request, response);
	}

}