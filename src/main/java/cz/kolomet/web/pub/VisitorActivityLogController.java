package cz.kolomet.web.pub;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cz.kolomet.domain.VisitorActivityLog.VisitorActivityType;
import cz.kolomet.service.VisitorActivityLogService;

@Controller
@RequestMapping("/public/visitoractivitylogs")
public class VisitorActivityLogController {

	@Autowired
	private VisitorActivityLogService visitorActivityLogService;
	
	@RequestMapping(method = RequestMethod.GET)
	public void create(
			@RequestParam("sellerId") Long sellerId, 
			@RequestParam("productId") Long productId, 
			@RequestParam("activityType") VisitorActivityType activityType,
			@RequestParam("externalUrl") String externalUrl,
			HttpServletRequest httpServletRequest, 
			HttpServletResponse httpServletResponse) throws IOException {
		
		visitorActivityLogService.saveVisitorActivityLog(sellerId, productId, httpServletRequest.getRemoteAddr(), activityType);
		httpServletResponse.sendRedirect(externalUrl);
	}
	
}
