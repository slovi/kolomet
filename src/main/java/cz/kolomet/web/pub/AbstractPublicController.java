package cz.kolomet.web.pub;

import java.util.List;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.web.bind.annotation.ModelAttribute;

import cz.kolomet.domain.Category;
import cz.kolomet.domain.NewsItem;
import cz.kolomet.domain.Producer;
import cz.kolomet.domain.codelist.FigureHeight;
import cz.kolomet.repository.CategoryRepository;
import cz.kolomet.repository.NewsItemRepository;
import cz.kolomet.repository.NewsItemSpecifications;
import cz.kolomet.service.CategoryTypeService;
import cz.kolomet.service.FigureHeightService;
import cz.kolomet.service.ProducerService;
import cz.kolomet.web.AbstractController;

public class AbstractPublicController extends AbstractController implements InitializingBean {
	
	private Integer newsItemsSize = 10;
	
	private Long bikeCategoryTypeId;
	
	private Long otherCategoryTypeId;
	
	@Autowired
	private ProducerService producerService; 
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	@Autowired
	private CategoryTypeService categoryTypeService;
	
	@Autowired
	private NewsItemRepository newsItemRepository;
	
	@Autowired
	private FigureHeightService figureHeightsService;
	
	@ModelAttribute("categorys")
	public List<Category> loadCategories() {
		return categoryRepository.find(bikeCategoryTypeId);
	}
	
	@ModelAttribute("producers")
	public List<Producer> loadProducers() {
		return producerService.findAllProducers();
	}
	
	@ModelAttribute("figureheights")
	public List<FigureHeight> loadFigureHeights() {
		return figureHeightsService.findAllFigureHeights();
	}
	
	@ModelAttribute("newsItems")
	public List<NewsItem> loadNewsItems() {
		return newsItemRepository.findAll(NewsItemSpecifications.allNewsItems(), new PageRequest(0, newsItemsSize, Direction.DESC, "newsItemDate")).getContent();
	}
	
	@ModelAttribute("newsBanners")
	public List<NewsItem> loadNewsBanners() {
		return newsItemRepository.findAll(NewsItemSpecifications.allNewsBanners(), new PageRequest(0, newsItemsSize, Direction.DESC, "newsItemDate")).getContent(); 
	}
	
	@ModelAttribute("bikeCategoryTypeId")
	public Long getBikeCategoryTypeId() {
		return bikeCategoryTypeId;
	}
	
	@ModelAttribute("otherCategoryTypeId")
	public Long getOtherCategoryTypeId() {
		return otherCategoryTypeId;
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		this.bikeCategoryTypeId = categoryTypeService.findByCategoryCodeKey("cattype_bike").getId();
		this.otherCategoryTypeId = categoryTypeService.findByCategoryCodeKey("cattype_other").getId();
	}

}