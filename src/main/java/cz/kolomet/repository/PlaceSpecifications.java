package cz.kolomet.repository;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.data.jpa.domain.Specification;

import cz.kolomet.domain.ApplicationUser;
import cz.kolomet.domain.GpsLocation;
import cz.kolomet.domain.Place;
import cz.kolomet.domain.codelist.PlaceType;
import cz.kolomet.dto.PlaceFilterDto;

public class PlaceSpecifications {
	
	public static Specification<Place> radiusPlaces(final GpsLocation gpsLocation, final Double radius) {
		
		return new Specification<Place>() {
			
			@Override
			public Predicate toPredicate(Root<Place> root, CriteriaQuery<?> query, CriteriaBuilder cb) {

				List<Predicate> predicates = new ArrayList<Predicate>();
				
				Join<Place, GpsLocation> gpsLocationJoin = root.join("gpsLocation");
				
				cb.between(gpsLocationJoin.<Double> get("north"), gpsLocation.getNorth() - radius, gpsLocation.getNorth() + radius);
				cb.between(gpsLocationJoin.<Double> get("west"), gpsLocation.getWest() - radius, gpsLocation.getWest() + radius);
				return cb.and(predicates.toArray(new Predicate[0]));
			}
		};
		
	}
	
	public static Specification<Place> ownPlaces(final Long userId) {
		
		return new Specification<Place>() {
			
			@Override
			public Predicate toPredicate(Root<Place> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				
				Join<Place, ApplicationUser> applicationUserJoin = root.join("createdBy");
				return cb.equal(applicationUserJoin.get("id"), userId);
			}
			
		};
		
	}

	public static Specification<Place> forPlaceFilter(final PlaceFilterDto placeFilterDto) {
		
		return new Specification<Place>() {

			@Override
			public Predicate toPredicate(Root<Place> root, CriteriaQuery<?> query, CriteriaBuilder cb) {

				List<Predicate> predicates = new ArrayList<Predicate>();
				
				if (placeFilterDto.getRegion() != null) {
					predicates.add(cb.equal(root.get("region"), placeFilterDto.getRegion()));
				}
				if (placeFilterDto.getPlaceTypes() != null) {
					Expression<PlaceType> placeType = root.get("placeType");
					predicates.add(placeType.in(placeFilterDto.getPlaceTypes()));
				}
				
				return cb.and(predicates.toArray(new Predicate[0]));
			}
		};
		
	}
	
	public static Sort getTopSort() {
		
		Order rankingOrder = new Order(Direction.DESC, "qualityRanking");
		Order nrOfRankingsOrder = new Order(Direction.DESC, "nrOfRankings");
		Order idOrder = new Order(Direction.DESC, "id");
		
		return new Sort(rankingOrder, nrOfRankingsOrder, idOrder);
	}
	
}
