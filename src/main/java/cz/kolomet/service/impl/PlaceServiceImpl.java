package cz.kolomet.service.impl;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.domain.Specifications;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cz.kolomet.domain.ApplicationUser;
import cz.kolomet.domain.Place;
import cz.kolomet.domain.RateType;
import cz.kolomet.domain.codelist.PlaceType;
import cz.kolomet.dto.PlaceDto;
import cz.kolomet.dto.PlaceFilterDto;
import cz.kolomet.dto.PlaceMapDto;
import cz.kolomet.repository.ApplicationUserRepository;
import cz.kolomet.repository.PlaceRepository;
import cz.kolomet.repository.PlaceSpecifications;
import cz.kolomet.service.PlaceService;
import cz.kolomet.service.RatedService;
import cz.kolomet.service.UrlService;
import cz.kolomet.service.exception.ExistingPlaceException;
import cz.kolomet.util.StringUtils;

@Service
@Transactional
public class PlaceServiceImpl implements PlaceService, RatedService, InitializingBean {

	private static final Double LOCATION_RADIUS = 0.0006d;
	
	@Autowired
    private PlaceRepository placeRepository;
	
	@Autowired
	private ApplicationUserRepository applicationUserRepository;
	
	private DecimalFormat decimalFormat;
	
	@Value("${domain.dynamic}")
	private String domain;
	
	@Value("${domain.google.static}")
	private String googleStaticDomain;
	
	@Autowired
	private UrlService urlService;

	@Override
	public PlaceMapDto findPlaceMapDto(PlaceFilterDto placeFilterDto, Long user) {
		
		List<PlaceDto> placesDtos = findPlaceDtos(placeFilterDto, user); 

		PlaceMapDto placeMapDto = new PlaceMapDto();
		placeMapDto.setPlaces(placesDtos);
		return placeMapDto;
	}

	@Override
	public long countAllPlaces() {
        return placeRepository.count();
    }

	@Override
	@PreAuthorize("principal.isCapableToDeletePlace(#place)")
	public void deletePlace(Place place) {
        placeRepository.delete(place);
    }

	@Override
	@PostAuthorize("isAnonymous() or principal.isCapableToDisplayPlace(returnObject)")
	public Place findPlace(Long id) {
        return placeRepository.findOne(id);
    }

	@Override
	public List<PlaceDto> findPlaceDtos(PlaceFilterDto placeFilterDto, Long applicationUser) {
		
		Specification<Place> placeSpecification = PlaceSpecifications.forPlaceFilter(placeFilterDto);
		
		List<Place> places = findPlaceEntries(placeSpecification);
		List<Place> visitedPlaces = null;
		if (applicationUser != null) {
			visitedPlaces = findPlaceEntries(Specifications.where(placeSpecification).and(PlaceSpecifications.visitedPlaces(applicationUser)));
		}
		
		List<PlaceDto> placeDtos = new ArrayList<PlaceDto>();
		for (Place place: places) {
			PlaceDto placeDto = new PlaceDto();
			placeDto.setId(place.getId());
			placeDto.setName(place.getName());
			placeDto.setGpsLocation(place.getGpsLocation());
			PlaceType placeType = place.getPlaceType();
			placeDto.setPlaceType(placeType.getCodeDescription());
			placeDto.setPlaceTypeColor(placeType.getPlaceTypeColor().toString());
			placeDto.setUrl("tour/public/places/" + place.getSimplifiedName());
			if (visitedPlaces != null && visitedPlaces.contains(place)) {
				placeDto.setBeenThere(true);
			}
			if (placeFilterDto.getRegion() != null) {
				placeDto.setIconUrl(domain + (placeDto.isBeenThere() ? placeType.getMyLargeIconUrl() : placeType.getLargeIconUrl()));
			} else {
				placeDto.setIconUrl(domain + (placeDto.isBeenThere() ? placeType.getMyIconUrl() : placeType.getIconUrl()));
			}
			placeDto.setLargeIconUrl(domain + placeType.getMyLargeIconUrl());
			placeDtos.add(placeDto);
		}
		return placeDtos;
	}
	
	@Override
	public List<Place> findAllPlaces() {
        return placeRepository.findAll();
    }

	@Override
	public List<Place> findPlaceEntries(int firstResult, int maxResults) {
        return placeRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }

	@Override
	@PreAuthorize("principal.isCapableToSavePlace(#place)")
	public void savePlace(Place place) {
		
		Double northFrom = place.getGpsLocation().getNorth() - LOCATION_RADIUS;
		Double northTo = place.getGpsLocation().getNorth() + LOCATION_RADIUS;
		Double westFrom = place.getGpsLocation().getWest() - LOCATION_RADIUS;
		Double westTo = place.getGpsLocation().getWest() + LOCATION_RADIUS;
		
		List<Place> placesInSameRadius = placeRepository.findByRadius(northFrom, northTo, westFrom, westTo);
		if (!placesInSameRadius.isEmpty()) {
			throw new ExistingPlaceException(placesInSameRadius.get(0));
		}
        placeRepository.save(place);
        place.simplifyName();
    }

	@Override
	@PreAuthorize("principal.isCapableToUpdatePlace(#place)")
	public Place updatePlace(Place place) {
		
		Double northFrom = place.getGpsLocation().getNorth() - LOCATION_RADIUS;
		Double northTo = place.getGpsLocation().getNorth() + LOCATION_RADIUS;
		Double westFrom = place.getGpsLocation().getWest() - LOCATION_RADIUS;
		Double westTo = place.getGpsLocation().getWest() + LOCATION_RADIUS;
		
		List<Place> placesInSameRadius = placeRepository.findByRadius(northFrom, northTo, westFrom, westTo, Arrays.asList(new Place[]{place}));
		if (!placesInSameRadius.isEmpty()) {
			throw new ExistingPlaceException(placesInSameRadius.get(0));
		}
		place.forceSimplifyName();
        return placeRepository.save(place);
    }

	@Override
	public void addRate(Long id, Integer value) {
		Place place = placeRepository.findOne(id);
		place.increaseRate(value);
		placeRepository.save(place);
	}
	
	@Override
	public boolean supports(RateType rateType) {
		return rateType == RateType.PLACE;
	}
	
	@Override
	public Page<Place> findPlaceEntries(Specification<Place> specification, Pageable pageable) {
		return placeRepository.findAll(specification, pageable);
	}
	
	@Override
	public List<Place> findPlaceEntries(Specification<Place> specification) {
		return placeRepository.findAll(specification);
	}
	
	@Override
	public List<Place> findTopPlaces(Specification<Place> specification, int nubmerOfPlaces) {
		Pageable pagable = new PageRequest(0, nubmerOfPlaces, PlaceSpecifications.getTopSort());
		return placeRepository.findAll(specification, pagable).getContent();
	}
	
	@Override
	public void assignVisitedUser(Long placeId, Boolean beenThere, ApplicationUser applicationUser) {
		ApplicationUser reloadedApplicationUser = applicationUserRepository.findOne(applicationUser.getId());
		assignVisitedUser(findPlace(placeId), beenThere, reloadedApplicationUser);
	}
	
	@Override
	public void assignVisitedUser(Place place, Boolean beenThere, ApplicationUser applicationUser) {
		if (beenThere) {
			place.addVisitedUser(applicationUser);
		} else {
			place.removeVisitedUser(applicationUser);
		}
	}
	
	
	public String generateStaticMapLink(PlaceFilterDto placeFilterDto, Long user) {
		
		StringBuilder link = new StringBuilder();
		link.append("?size=600x400");
		link.append("&format=jpg");
		if (placeFilterDto.getRegion() != null && placeFilterDto.getRegion().getGpsLocation() != null && 
			placeFilterDto.supportsRegionStaticMapLinkGeneration()) {
			link.append("&center=");
			link.append(decimalFormat.format(placeFilterDto.getRegion().getGpsLocation().getNorth()));
			link.append(",");
			link.append(decimalFormat.format(placeFilterDto.getRegion().getGpsLocation().getWest()));
			if (placeFilterDto.getRegion().getZoom() != null) {
				link.append("&zoom=");
				link.append(placeFilterDto.getRegion().getZoom());
			} else {
				link.append("&zoom=");
				link.append(placeFilterDto.getDefaultRegionZoom());
			}
		} else {
			link.append("&center=");
			link.append(decimalFormat.format(placeFilterDto.getDefaultCenterNorth()));
			link.append(",");
			link.append(decimalFormat.format(placeFilterDto.getDefaultCenterWest()));
			link.append("&zoom=");
			link.append(placeFilterDto.getDefaultZoom());
		}
		
		Map<String, StringBuilder> placeTypesBuilders = new HashMap<String, StringBuilder>();
		
		List<PlaceDto> placeDtos = findPlaceDtos(placeFilterDto, user);  
	
		for (PlaceDto placeDto: placeDtos) {
			StringBuilder builder = placeTypesBuilders.get(placeDto.getPlaceType());
			if (builder == null) {
				builder = new StringBuilder();
				builder.append("icon:");
				builder.append(placeDto.getLargeIconUrl());
				placeTypesBuilders.put(placeDto.getPlaceType(), builder);
			}
			if (placeDto.isBeenThere()) {
				builder.append(StringUtils.encodeUrl("|"));
				builder.append(decimalFormat.format(placeDto.getGpsLocation().getNorth()));
				builder.append(",");
				builder.append(decimalFormat.format(placeDto.getGpsLocation().getWest()));
			}
		}
		for (StringBuilder placeTypeBuilder: placeTypesBuilders.values()) {
			link.append("&markers=");
			link.append(placeTypeBuilder);
		}
		try {
			return urlService.shortUrl(googleStaticDomain + link.toString());
		} catch (Exception e) {
			return googleStaticDomain + link.toString();
		}
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		
		DecimalFormatSymbols symbols = new DecimalFormatSymbols();
		symbols.setDecimalSeparator('.');
		this.decimalFormat = new DecimalFormat("#.000", symbols);
	}
	
}
