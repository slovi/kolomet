package cz.kolomet.web.pub;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import cz.kolomet.repository.CategoryRepository;
import cz.kolomet.service.CategoryTypeService;
import cz.kolomet.service.FigureHeightService;
import cz.kolomet.service.NewsItemService;
import cz.kolomet.service.ProducerService;
import cz.kolomet.service.RegionService;
import cz.kolomet.web.AbstractController;

public class AbstractPublicController extends AbstractController implements InitializingBean {
	
	private Integer newsItemsSize = 10;
	
	private Long bikeCategoryTypeId;
	
	private Long otherCategoryTypeId;
	
	@Value("${applicationuser.agreement.version}")
	private String agreementVersion;
	
	@Autowired
	private ProducerService producerService; 
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	@Autowired
	private CategoryTypeService categoryTypeService;
	
	@Autowired
	private FigureHeightService figureHeightsService;
	
	@Autowired
	private RegionService regionService;
	
	@Autowired
	protected NewsItemService newsItemService;
	
	@ModelAttribute
	public void loadMenuModel(Model uiModel, HttpServletRequest request) {
		
		long menuModelStart = System.currentTimeMillis();
		if (logger.isDebugEnabled()) {
			logger.debug("Loading menu model");
		}
		
		if (!isAjaxRequest(request)) {
			if (isTour(request)) {
				uiModel.addAttribute("regions", regionService.findAllRegions());
				uiModel.addAttribute("agreementVersion", agreementVersion);				
			}
			
			if (isStore(request)) {
				uiModel.addAttribute("categorys", categoryRepository.find(bikeCategoryTypeId));
				uiModel.addAttribute("producers", producerService.findAllProducers());
				uiModel.addAttribute("figureheights", figureHeightsService.findAllFigureHeights());
				uiModel.addAttribute("bikeCategoryTypeId", bikeCategoryTypeId);
				uiModel.addAttribute("otherCategoryTypeId", otherCategoryTypeId);
				uiModel.addAttribute("agreementVersion", agreementVersion);
				uiModel.addAttribute("newsBanners", newsItemService.findProductNewsBanners(getNewsItemsPageRequest()));
			}
			
			uiModel.addAttribute("newsItems", newsItemService.findAllNewsItems(getNewsItemsPageRequest()));
		}

		if (logger.isDebugEnabled()) {
			logger.debug("Loading menu finished, took: " + (menuModelStart - System.currentTimeMillis()));
		}
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		this.bikeCategoryTypeId = categoryTypeService.findByCategoryCodeKey("cattype_bike").getId();
		this.otherCategoryTypeId = categoryTypeService.findByCategoryCodeKey("cattype_other").getId();
	}
	
	protected PageRequest getNewsItemsPageRequest() {
		return new PageRequest(0, newsItemsSize, Direction.DESC, "newsItemDate");
	}

}