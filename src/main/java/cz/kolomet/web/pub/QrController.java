package cz.kolomet.web.pub;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QrController {
	
	@Value("${qr.redirect}")
	private String qrRedirect;
	
	@RequestMapping("/qr")
	public void redirectToQrUrl(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.sendRedirect(qrRedirect);
	}

}
