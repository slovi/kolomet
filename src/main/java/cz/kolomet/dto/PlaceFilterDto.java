package cz.kolomet.dto;

import java.util.List;

import cz.kolomet.domain.codelist.PlaceType;
import cz.kolomet.domain.codelist.Region;

public class PlaceFilterDto {
	
	private Region region;
	
	private List<PlaceType> placeTypes;
	
	private Integer defaultZoom = 7;
	
	private Integer defaultRegionZoom = 9;
	
	private Double defaultCenterWest = 15.5d;
	
	private Double defaultCenterNorth = 49.8d;
	
	private boolean actual = true;
	
	private boolean usedFilter;
	
	private boolean visitedPlaces;
	
	private Long visitedUser;
	
	private Long user;

	public boolean existsPlaceType() {		
		if (getPlaceTypes() != null) {
			for (PlaceType placeType: getPlaceTypes()) {
				if (placeType != null) {
					return true;
				}
			}
		}
		return false;
	}
	
	public boolean supportsRegionStaticMapLinkGeneration() {
		return region == null || (region != null && region.getGenerateStaticMapLink());
	}
	
	public Region getRegion() {
		return region;
	}

	public void setRegion(Region region) {
		this.region = region;
	}

	public List<PlaceType> getPlaceTypes() {
		return placeTypes;
	}

	public void setPlaceTypes(List<PlaceType> placeTypes) {
		this.placeTypes = placeTypes;
	}

	public Integer getDefaultZoom() {
		return defaultZoom;
	}

	public void setDefaultZoom(Integer defaultZoom) {
		this.defaultZoom = defaultZoom;
	}

	public Integer getDefaultRegionZoom() {
		return defaultRegionZoom;
	}

	public void setDefaultRegionZoom(Integer defaultRegionZoom) {
		this.defaultRegionZoom = defaultRegionZoom;
	}

	public Double getDefaultCenterWest() {
		return defaultCenterWest;
	}

	public void setDefaultCenterWest(Double defaultCenterWest) {
		this.defaultCenterWest = defaultCenterWest;
	}

	public Double getDefaultCenterNorth() {
		return defaultCenterNorth;
	}

	public void setDefaultCenterNorth(Double defaultCenterNorth) {
		this.defaultCenterNorth = defaultCenterNorth;
	}

	public boolean isUsedFilter() {
		return usedFilter;
	}

	public void setUsedFilter(boolean usedFilter) {
		this.usedFilter = usedFilter;
	}

	public boolean isActual() {
		return actual;
	}

	public void setActual(boolean actual) {
		this.actual = actual;
	}

	public boolean isVisitedPlaces() {
		return visitedPlaces;
	}

	public void setVisitedPlaces(boolean visitedPlaces) {
		this.visitedPlaces = visitedPlaces;
	}

	public Long getVisitedUser() {
		return visitedUser;
	}

	public void setVisitedUser(Long visitedUser) {
		this.visitedUser = visitedUser;
	}

	public Long getUser() {
		return user;
	}

	public void setUser(Long user) {
		this.user = user;
	}

}
