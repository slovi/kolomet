package cz.kolomet.util.web;

import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.ApplicationContext;

import com.octo.captcha.service.CaptchaServiceException;
import com.octo.captcha.service.image.ImageCaptchaService;

public class CaptchaServlet extends AbstractSpringServlet {
	
	private ImageCaptchaService captchaService;
	
	@Override
	protected void init(ApplicationContext applicationContext) {
		this.captchaService = applicationContext.getBean(ImageCaptchaService.class);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String captchaType = req.getParameter("type");
		if (StringUtils.isNotEmpty(captchaType)) {
			generateCaptcha(captchaType, req, resp);
		}
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
