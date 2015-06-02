package cz.kolomet.repository;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.jpa.domain.Specification;

import cz.kolomet.domain.Seller;

public class SellerSpecifications {
	
	public static Specification<Seller> enabledSeller() {
		return new Specification<Seller>() {

			@Override
			public Predicate toPredicate(Root<Seller> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				return cb.equal(root.<Boolean> get("enabled"), true);
			}
		};
	}

}
