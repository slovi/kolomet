package cz.kolomet.web;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URLDecoder;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.octo.captcha.service.CaptchaServiceException;
import com.octo.captcha.service.image.ImageCaptchaService;

@Controller
public class DownloadFileController {

	@Value("${img.rootdir}")
	private String rootDir;
	
	@Autowired
	private ImageCaptchaService captchaService;
	
	protected final Log logger = LogFactory.getLog(getClass());

	@RequestMapping(value = "/file/**", method = RequestMethod.GET)
	public void download(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) throws Exception {

		logger.debug("Downloading file: " + request.getRequestURI());
		
		String requestUri = URLDecoder.decode(request.getRequestURI(), "UTF-8");
		int lastSemicolonIndex = requestUri.lastIndexOf(';');
		int filePathIndex = request.getContextPath().length() + "/file".length();
		String pathInfo = requestUri.substring(filePathIndex, lastSemicolonIndex > 0 ? lastSemicolonIndex : requestUri.length());

		response.setContentType("image/jpeg");	

		File file = new File(rootDir + pathInfo);
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(file);
			IOUtils.copy(fis, response.getOutputStream());
			logger.debug("Successfuly downloaded file: " + file.getAbsolutePath());
		} catch (FileNotFoundException e) {
			logger.warn(e);
			response.sendError(HttpServletResponse.SC_NOT_FOUND, e.getLocalizedMessage());
		} finally {
			if (fis != null) {
				fis.close();
			}
		}
	}

	@RequestMapping(value = "/captcha_registrationrequest", method = RequestMethod.GET)
	public void downloadRegistrationRequestCaptcha(HttpServletRequest request, HttpServletResponse response) throws Exception {

		generateCaptcha("registration_request", request, response);

	}
	
	@RequestMapping(value = "/captcha_resetpassword", method = RequestMethod.GET)
	public void downloadResetPasswordCaptcha(HttpServletRequest request, HttpServletResponse response) throws Exception {

		generateCaptcha("reset_password", request, response);

	}

	private void generateCaptcha(String type, HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			// get the session id that will identify the generated captcha.
			// the same id must be used to validate the response, the session id is a good candidate!

			String captchaId = request.getSession().getId();

			// call the ImageCaptchaService getChallenge method
			BufferedImage challenge = captchaService.getImageChallengeForID(type + "_" + captchaId, request.getLocale());
			ImageIO.write(challenge, "jpeg", response.getOutputStream());

			// flush it in the response
			response.setHeader("Cache-Control", "no-store");
			response.setHeader("Pragma", "no-cache");
			response.setDateHeader("Expires", 0);

		} catch (IllegalArgumentException e) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
		} catch (CaptchaServiceException e) {
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		}
	}

}
