package cz.kolomet.web.pub;

import java.io.File;
import java.io.FilenameFilter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.io.FileUtils;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cz.kolomet.domain.ApplicationUserPhoto;
import cz.kolomet.domain.BasePhoto;
import cz.kolomet.domain.NewsItemPhotoUrl;
import cz.kolomet.domain.PhotoUrl;
import cz.kolomet.domain.Place;
import cz.kolomet.domain.PlacePhotoUrl;
import cz.kolomet.domain.Rate;
import cz.kolomet.domain.RateType;
import cz.kolomet.domain.SellerPhotoUrl;
import cz.kolomet.domain.codelist.PlaceType;
import cz.kolomet.dto.PlaceFilterDto;
import cz.kolomet.repository.PlaceSpecifications;
import cz.kolomet.service.PlaceService;
import cz.kolomet.service.PlaceTypeService;
import cz.kolomet.service.RateService;

@RequestMapping("/public/places")
@Controller("publicPlaceController")
public class PlaceController extends AbstractPublicController {
	
	private static String[] jsonFields = new String[] {"id", "name", "placeType.placeTypeColor", "gpsLocation.north", "gpsLocation.west"};
	private static final int TOP_PLACES_NUMBER = 3;
	
	@Autowired
	private PlaceService placeService;
	
	@Autowired
	private RateService rateService;

	@Autowired
	private PlaceTypeService placeTypeService;
	
	@RequestMapping(value = "/rate", method = RequestMethod.POST, produces = "text/html")
    public String rate(@Valid Rate rate, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
		rate.setIpAddress(httpServletRequest.getRemoteAddr());
        rateService.saveRate(rate);        
        return show(rate.getEntityId(), uiModel, httpServletRequest);
    }
	
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel, HttpServletRequest request) {
        
    	addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("place", placeService.findPlace(id));
        uiModel.addAttribute("itemId", id);
        
        List<Rate> existingRates = rateService.findRate(RateType.PLACE, id, request.getRemoteAddr());
        uiModel.addAttribute("isRated", !existingRates.isEmpty());
        
        addDateTimeFormatPatterns(uiModel);
        return "public/places/show";
    }

	@RequestMapping(produces = "text/html")
    public String list(@Valid PlaceFilterDto placeFilter,  Model uiModel) {
		
		Specification<Place> placeSpecification = PlaceSpecifications.forPlaceFilter(placeFilter);
		uiModel.addAttribute("placesJson", Place.toJsonArray(placeService.findPlaceEntries(placeSpecification), jsonFields));
		uiModel.addAttribute("topPlaces", placeService.getTopPlaces(placeSpecification, TOP_PLACES_NUMBER));
		
		List<PlaceType> placeTypes = placeTypeService.findAllPlaceTypes();
		uiModel.addAttribute("placeTypes", placeTypes);
		
		if (!placeFilter.isUsedFilter()) {
			PlaceFilterDto placeFilterDto = new PlaceFilterDto();
			placeFilterDto.setPlaceTypes(placeTypes);
			uiModel.addAttribute("placeFilter", placeFilterDto);
		} else {
			uiModel.addAttribute("placeFilter", placeFilter);
		}
		
        addDateTimeFormatPatterns(uiModel);
        return "public/places/list";
    }
	
	@Override
	public void afterPropertiesSet() throws Exception {
		
		super.afterPropertiesSet();
		
		String[] photoTypes = {PlacePhotoUrl.PHOTO_URL_PREFIX, NewsItemPhotoUrl.PHOTO_URL_PREFIX, PhotoUrl.PHOTO_URL_PREFIX, SellerPhotoUrl.PHOTO_URL_PREFIX, ApplicationUserPhoto.PHOTO_URL_PREFIX};
		
		File rootFile = new File(rootDir);
		
		for (String photoType: photoTypes) {
			File photoTypeFile = new File(rootFile, photoType);
			for (File idFiles: photoTypeFile.listFiles()) {
				
				File[] photoFiles = idFiles.listFiles(new FilenameFilter() {
					
					@Override
					public boolean accept(File dir, String name) {
						return name.contains(BasePhoto.ORIGINAL_IMG_SUFFIX);
					}
				});
				
				for (File photoFile: photoFiles) {
					
					String baseName = photoFile.getName().replaceAll(BasePhoto.ORIGINAL_IMG_SUFFIX, "");
					File detailPhotoFile = new File(photoFile.getParent(), BasePhoto.getPhotoUrlFileName(baseName, BasePhoto.DETAIL_IMG_SUFFIX));
					if (!detailPhotoFile.exists()) {
						FileUtils.copyFile(photoFile, detailPhotoFile);
					}
				}
			}
		}
		
	}
	

	void addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("place_created_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("place_lastmodified_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }
}