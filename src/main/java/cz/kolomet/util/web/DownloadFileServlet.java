package cz.kolomet.util.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Properties;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import cz.kolomet.domain.BasePhoto;

public class DownloadFileServlet extends HttpServlet {
	
	private String rootDir;
	
	protected final Log logger = LogFactory.getLog(getClass());
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		
		// initialize attributes
		ApplicationContext context = WebApplicationContextUtils.getRequiredWebApplicationContext(config.getServletContext());
		Properties properties = context.getBean("applicationProperties", Properties.class);
		this.rootDir = properties.getProperty("img.rootdir");
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		logger.debug("Downloading file: " + request.getRequestURI());
		
		String pathInfo = resolveFilePathFromRequest(request);
		File resolvedFile = new File(rootDir + pathInfo);
		File resultFile = null;
		
		// if we have format parameter, we should reformat fileName to required format, ie: P702005.JPG -> P702005_org.JPG  
		if (StringUtils.isNotEmpty(request.getParameter("format"))) {
			String suffix = request.getParameter("format");
			String fileName = BasePhoto.getPhotoUrlFileName(resolvedFile.getName(), suffix);
			resultFile = new File(resolvedFile.getParent(), fileName);
		} else {
			resultFile = resolvedFile;
		}
		
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(resultFile);
			IOUtils.copy(fis, response.getOutputStream());
			logger.debug("Successfuly downloaded file: " + resultFile.getAbsolutePath());
			response.setContentType("image/jpeg");	
		} catch (FileNotFoundException e) {
			logger.warn(e);
			response.sendError(HttpServletResponse.SC_NOT_FOUND, e.getLocalizedMessage());
		} finally {
			if (fis != null) {
				fis.close();
			}
		}
		
	}
	
	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		logger.debug("Try to delete file: " + request.getRequestURI());
		
		String pathInfo = resolveFilePathFromRequest(request);
		File resolvedFile = new File(rootDir + pathInfo);
		resolvedFile.delete();
	}
	
	private String resolveFilePathFromRequest(HttpServletRequest request) throws UnsupportedEncodingException {
		String requestUri = URLDecoder.decode(request.getRequestURI(), "UTF-8");
		int lastSemicolonIndex = requestUri.lastIndexOf(';');
		int filePathIndex = request.getContextPath().length() + "/file".length();
		String pathInfo = requestUri.substring(filePathIndex, lastSemicolonIndex > 0 ? lastSemicolonIndex : requestUri.length());
		return pathInfo;
	}	

}
