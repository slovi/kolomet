package cz.kolomet.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cz.kolomet.domain.NewsItemPhotoUrl;
import cz.kolomet.service.NewsItemPhotoUrlService;
import cz.kolomet.service.exception.CommonServiceException;
import cz.kolomet.service.exception.IgnorableCommonServiceException;
import cz.kolomet.service.exception.ResizeImageException;
import cz.kolomet.util.web.ajax.AjaxResponse;
import cz.kolomet.web.admin.AbstractAdminController;

@RequestMapping("/admin/newsitemphotourls")
@Controller
public class NewsItemPhotoUrlController extends AbstractAdminController {
	
	@Autowired
	private NewsItemPhotoUrlService newsItemPhotoUrlService;
	
    @ResponseBody
    @RequestMapping(method = {RequestMethod.POST, RequestMethod.PUT}, value = "/file")
    public AjaxResponse savePhoto(@RequestParam("content") MultipartFile content, HttpServletRequest request, HttpServletResponse response) throws Exception {
    	try {
    		saveFile(newsItemPhotoUrlService, content, request.getSession().getId());
    		return AjaxResponse.emptySuccessul();
    	} catch (ResizeImageException e) {
    		throw new IgnorableCommonServiceException(
    				messageSourceAcessor.getMessage("error_file_is_not_image"), CommonServiceException.FILE_NOT_SUPPORTED_FORMAT);
    	}
    }
    
    @ResponseBody
    @RequestMapping(method = {RequestMethod.DELETE}, value = "/{photoId}")
    public AjaxResponse deletePhoto(@PathVariable("photoId") Long photoId, HttpServletRequest request) throws Exception {
    	NewsItemPhotoUrl photo = newsItemPhotoUrlService.findNewsItemPhotoUrl(photoId);
    	newsItemPhotoUrlService.deletePhoto(photo);
    	return AjaxResponse.emptySuccessul();
    }
	

}
