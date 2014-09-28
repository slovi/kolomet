package cz.kolomet.web.pub;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import cz.kolomet.repository.CategoryRepository;
import cz.kolomet.repository.NewsItemRepository;
import cz.kolomet.repository.NewsItemSpecifications;
import cz.kolomet.service.CategoryTypeService;
import cz.kolomet.service.FigureHeightService;
import cz.kolomet.service.ProducerService;
import cz.kolomet.service.RegionService;
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
	
	@Autowired
	private RegionService regionService;
	
	@ModelAttribute
	public void loadMenuModel(Model uiModel, HttpServletRequest request) {
		
		if (isTour(request)) {
			uiModel.addAttribute("regions", regionService.findAllRegions());
		}
		
		if (isStore(request)) {
			uiModel.addAttribute("categorys", categoryRepository.find(bikeCategoryTypeId));
			uiModel.addAttribute("producers", producerService.findAllProducers());
			uiModel.addAttribute("figureheights", figureHeightsService.findAllFigureHeights());
			uiModel.addAttribute("newsItems", newsItemRepository.findAll(NewsItemSpecifications.allNewsItems(), new PageRequest(0, newsItemsSize, Direction.DESC, "newsItemDate")).getContent());
			uiModel.addAttribute("bikeCategoryTypeId", bikeCategoryTypeId);
			uiModel.addAttribute("otherCategoryTypeId", otherCategoryTypeId);
		}
		
		uiModel.addAttribute("newsBanners", newsItemRepository.findAll(NewsItemSpecifications.allNewsBanners(), new PageRequest(0, newsItemsSize, Direction.DESC, "newsItemDate")).getContent());
		
		return ;
	}
	
	@Override
	public void afterPropertiesSet() throws Exception {
		this.bikeCategoryTypeId = categoryTypeService.findByCategoryCodeKey("cattype_bike").getId();
		this.otherCategoryTypeId = categoryTypeService.findByCategoryCodeKey("cattype_other").getId();
	}

}