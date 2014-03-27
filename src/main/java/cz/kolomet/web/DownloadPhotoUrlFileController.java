package cz.kolomet.web;

import java.io.File;
import java.io.FileInputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("/file/**")
@Controller
public class DownloadPhotoUrlFileController {

	@Value("${img.rootdir}")
	private String rootDir;
	
    @RequestMapping(method = RequestMethod.GET)
    public void download(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
    	
    	String pathInfo = request.getRequestURI().substring(request.getContextPath().length() + "/file".length());
    	
    	response.setContentType("image/jpeg");

    	File file  = new File(rootDir + pathInfo);
		
		IOUtils.copy(new FileInputStream(file), response.getOutputStream());
    }

}
