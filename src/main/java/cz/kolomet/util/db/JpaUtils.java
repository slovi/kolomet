package cz.kolomet.util.db;

import java.math.BigDecimal;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Predicate;

public class JpaUtils {
	
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
