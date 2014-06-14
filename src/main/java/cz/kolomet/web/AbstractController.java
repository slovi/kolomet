package cz.kolomet.web;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.bind.annotation.ModelAttribute;

public class AbstractController {
	
	protected final Log logger = LogFactory.getLog(getClass());
	
	public static final int DEFAULT_PAGE_SIZE = 25;
	
	
	@ModelAttribute("categoryPageSize")
	public int getCategoryPageSize() {
		return DEFAULT_PAGE_SIZE;
	}

}
