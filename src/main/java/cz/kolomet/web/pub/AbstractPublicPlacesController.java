package cz.kolomet.web.pub;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.web.bind.annotation.ModelAttribute;

import cz.kolomet.domain.NewsItem;
import cz.kolomet.domain.codelist.PlaceType;
import cz.kolomet.domain.codelist.Region;
import cz.kolomet.repository.NewsItemRepository;
import cz.kolomet.repository.NewsItemSpecifications;
import cz.kolomet.service.PlaceTypeService;
import cz.kolomet.service.RegionService;
import cz.kolomet.web.AbstractController;

public class AbstractPublicPlacesController extends AbstractController {
	
	private Integer newsItemsSize = 10;
	
	@Autowired
	private RegionService regionService;	
	
	@Autowired
	private NewsItemRepository newsItemRepository;
	
	@ModelAttribute("regions")
	public List<Region> loadRegions() {
		return regionService.findAllRegions();
	}

	@ModelAttribute("newsBanners")
	public List<NewsItem> loadNewsBanners() {
		return newsItemRepository.findAll(NewsItemSpecifications.allNewsBanners(), new PageRequest(0, newsItemsSize, Direction.DESC, "newsItemDate")).getContent(); 
	}

}
