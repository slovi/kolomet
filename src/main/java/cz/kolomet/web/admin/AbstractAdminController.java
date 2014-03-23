package cz.kolomet.web.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;

import cz.kolomet.domain.NewsItem;
import cz.kolomet.repository.NewsItemRepository;

public class AbstractAdminController {
	
	@Autowired
	private NewsItemRepository newsItemRepository;
	
	@ModelAttribute("newsItems")
	public List<NewsItem> loadNewsItems() {
		return newsItemRepository.findAll();
	}

}
