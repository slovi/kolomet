package cz.kolomet.repository;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.data.jpa.domain.Specification;

import cz.kolomet.domain.Place;
import cz.kolomet.dto.PlaceFilterDto;

public class PlaceSpecifications {

	public static Specification<Place> forPlaceFilter(final PlaceFilterDto placeFilterDto) {
		
		return new Specification<Place>() {

			@Override
			public Predicate toPredicate(Root<Place> root, CriteriaQuery<?> query, CriteriaBuilder cb) {

				List<Predicate> predicates = new ArrayList<Predicate>();
				
				if (placeFilterDto.getRegion() != null) {
					predicates.add(cb.equal(root.get("region"), placeFilterDto.getRegion()));
				}
				if (placeFilterDto.getPlaceType() != null) {
					predicates.add(cb.equal(root.get("placeType"), placeFilterDto.getPlaceType()));
				}
				
				return cb.and(predicates.toArray(new Predicate[predicates.size()]));
			}
		};
		
	}
	
	public static Sort getTopSort() {
		
		Order rankingOrder = new Order(Direction.DESC, "qualityRanking");
		Order idOrder = new Order(Direction.DESC, "id");
		
		return new Sort(rankingOrder, idOrder);
	}
	
}