package cz.kolomet.web;
import javax.servlet.http.HttpServletRequest;

import cz.kolomet.domain.PlacePhotoUrl;
import cz.kolomet.util.web.ajax.AjaxError;
import cz.kolomet.util.web.ajax.AjaxResponse;
import cz.kolomet.web.admin.AbstractAdminController;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@RequestMapping("/admin/placephotourls")
@Controller
@RooWebScaffold(path = "admin/placephotourls", formBackingObject = PlacePhotoUrl.class, update = false)
public class PlacePhotoUrlController extends AbstractAdminController {
	
	@ResponseBody
	@RequestMapping(value = "/file", method = RequestMethod.POST)
	public AjaxResponse savePhoto(@RequestParam("content") MultipartFile content, HttpServletRequest request) {
		try {
			saveFile(content, request.getSession().getId());
			return AjaxResponse.emptySuccessul();
		} catch (RuntimeException e) {
			return AjaxResponse.error(AjaxError.ERROR_FILE_UPLOAD_CODE, e);
		}
	}
	
}
