package cz.kolomet.util.web.ajax;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.js.ajax.tiles2.AjaxTilesView;

public class AjaxModelAwareTilesView extends AjaxTilesView {

	private static final String MODEL_FRAGMENTS_PARAM = "modelFragments";

	@Override
	@SuppressWarnings("rawtypes")
	protected void renderMergedOutputModel(Map model, HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		super.renderMergedOutputModel(model, request, response);

		String modelFragmentsString = request.getParameter(MODEL_FRAGMENTS_PARAM);
		if (StringUtils.isNotEmpty(modelFragmentsString)) {
			String[] modelFragments = modelFragmentsString.split(",");
			for (String modelFragment : modelFragments) {
				Object modelFragmentValue = model.get(modelFragment);
				writeModelFragmentValue(modelFragment, modelFragmentValue, response);
			}
		}

	}

	protected void writeModelFragmentValue(String modelFragment, Object modelFragmentValue, HttpServletResponse response) throws Exception {

		PrintWriter writer = response.getWriter(); 
		writer.println("<span id=\"model__" + modelFragment + "\">");
		writer.println(modelFragmentValue);
		writer.println("</span>");
		writer.flush();

	}

}