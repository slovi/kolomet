package cz.kolomet.web.admin;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;

import cz.kolomet.domain.NewsItem;
import cz.kolomet.repository.NewsItemRepository;
import cz.kolomet.web.AbstractController;

public class AbstractAdminController extends AbstractController {
	
	@Autowired
	private NewsItemRepository newsItemRepository;
	
	@ModelAttribute("newsItems")
	public List<NewsItem> loadNewsItems() {
		return newsItemRepository.findAll();
	}
	
	protected String getUsername() {
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
