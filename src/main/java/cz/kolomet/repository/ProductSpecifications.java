package cz.kolomet.repository;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.jpa.domain.Specification;

import cz.kolomet.domain.Category;
import cz.kolomet.domain.Producer;
import cz.kolomet.domain.Product;
import cz.kolomet.dto.ProductFilter;

public class ProductSpecifications {
	
	public static Specification<Product> forProductFilter(final ProductFilter productFilter) {
		return new Specification<Product>() {

			@Override
			public Predicate toPredicate(Root<Product> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				
				List<Predicate> predicates = new ArrayList<Predicate>();
				addBetweenNumberPredicate(predicates, cb, root.<BigDecimal> get("price"), productFilter.getPriceFrom(), productFilter.getPriceTo());
				if (productFilter.getCategory() != null && !productFilter.getCategory().getCodeKey().equals(Category.ALL_CATEGORY_CODE_KEY)) {
					predicates.add(cb.equal(root.get("category"), productFilter.getCategory()));
				}
				if (productFilter.getProducer() != null) {
					Join<Product, Producer> producerJoin = root.join("producer");
					predicates.add(cb.equal(producerJoin, productFilter.getProducer()));
				}
				return cb.and(predicates.toArray(new Predicate[predicates.size()]));
			}
		};
	}
	
	public static void addBetweenNumberPredicate(List<Predicate> predicates, final CriteriaBuilder cb,
			final Expression<BigDecimal> expression, BigDecimal valueFrom, BigDecimal valueTo) {
		addBetweenPredicate(predicates, cb, expression, valueFrom, valueTo);
	}
	
	public static <T extends Comparable<? super T>> void addBetweenPredicate(List<Predicate> predicates,
			final CriteriaBuilder cb, final Expression<T> expression, T valueFrom, T valueTo) {
		if (valueFrom != null && valueTo == null) {
			predicates.add(cb.greaterThanOrEqualTo(expression, valueFrom));
		}
		if (valueFrom == null && valueTo != null) {
			predicates.add(cb.lessThanOrEqualTo(expression, valueTo));
		}
		if (valueFrom != null && valueTo != null) {
			predicates.add(cb.between(expression, valueFrom, valueTo));
		}
	}

}
