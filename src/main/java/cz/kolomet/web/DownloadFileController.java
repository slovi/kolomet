package cz.kolomet.web;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.octo.captcha.service.CaptchaServiceException;
import com.octo.captcha.service.image.ImageCaptchaService;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

@Controller
public class DownloadFileController {

	@Value("${img.rootdir}")
	private String rootDir;
	
	@Autowired
	private ImageCaptchaService captchaService;

	@RequestMapping(value = "/file/**", method = RequestMethod.GET)
	public void download(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response) throws Exception {

		String pathInfo = request.getRequestURI().substring(request.getContextPath().length() + "/file".length());

		response.setContentType("image/jpeg");

		File file = new File(rootDir + pathInfo);

		IOUtils.copy(new FileInputStream(file), response.getOutputStream());
	}

	@RequestMapping(value = "/captcha", method = RequestMethod.GET)
	public void downloadCaptcha(HttpServletRequest request, HttpServletResponse response) throws Exception {

		byte[] captchaChallengeAsJpeg = null;
		// the output stream to render the captcha image as jpeg into
		ByteArrayOutputStream jpegOutputStream = new ByteArrayOutputStream();
		try {
			// get the session id that will identify the generated captcha.
			// the same id must be used to validate the response, the session id is a good candidate!

			String captchaId = request.getSession().getId();

			// call the ImageCaptchaService getChallenge method
			BufferedImage challenge = captchaService.getImageChallengeForID(captchaId, request.getLocale());

			// a jpeg encoder
			JPEGImageEncoder jpegEncoder = JPEGCodec.createJPEGEncoder(jpegOutputStream);
			jpegEncoder.encode(challenge);
		} catch (IllegalArgumentException e) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
		} catch (CaptchaServiceException e) {
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		}

		captchaChallengeAsJpeg = jpegOutputStream.toByteArray();

		// flush it in the response
		response.setHeader("Cache-Control", "no-store");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		// response.setContentType("image/jpeg");
		// response.getOutputStream().write(jpegOutputStream);
		ServletOutputStream responseOutputStream = response.getOutputStream();
		responseOutputStream.write(captchaChallengeAsJpeg);
		responseOutputStream.flush();
		responseOutputStream.close();
	}

}
