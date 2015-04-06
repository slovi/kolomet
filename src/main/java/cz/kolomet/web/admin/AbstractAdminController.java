package cz.kolomet.web.admin;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import cz.kolomet.repository.NewsItemRepository;
import cz.kolomet.web.AbstractController;

public class AbstractAdminController extends AbstractController {
	
	@Override
	public String getPageTitleCode() {
		return "page_title_admin_default";
	}
	
	protected String getActualLoggedUsername() {
		return getActualUserDetails().getUsername();
	}
	
	protected String normalizeDescription(String description) {
		if (StringUtils.isNotEmpty(description)) {
			if (description.charAt(description.length() - 1) == '<') {
				return description.substring(0, description.length() - 2);
			}
		}
		return description;
	}

}
