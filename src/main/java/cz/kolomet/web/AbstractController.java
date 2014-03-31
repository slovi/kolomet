package cz.kolomet.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.web.bind.annotation.ModelAttribute;

import cz.kolomet.domain.Category;
import cz.kolomet.domain.NewsItem;
import cz.kolomet.domain.Producer;
import cz.kolomet.repository.CategoryRepository;
import cz.kolomet.repository.NewsItemRepository;
import cz.kolomet.repository.NewsItemSpecifications;
import cz.kolomet.repository.ProducerRepository;

public class AbstractController {
	
	private Integer newsItemsSize = 10;
	private String defaultCategoryCodeKey = "cattype_bike"; // TODO nastavit jako property
	
	@Autowired
	private ProducerRepository producerRepository; 
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	@Autowired
	private NewsItemRepository newsItemRepository;
	
	@ModelAttribute("categories")
	public List<Category> loadCategories() {
		return categoryRepository.find(defaultCategoryCodeKey);
	}
	
	@ModelAttribute("producers")
	public List<Producer> loadProducers() {
		return producerRepository.findAll();
	}
	
	@ModelAttribute("newsItems")
	public List<NewsItem> loadNewsItems() {
		return newsItemRepository.findAll(NewsItemSpecifications.allNewsItems(), new PageRequest(0, newsItemsSize, Direction.DESC, "newsItemDate")).getContent();
	}

}