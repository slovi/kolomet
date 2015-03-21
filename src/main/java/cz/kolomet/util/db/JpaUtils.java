package cz.kolomet.util.db;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Predicate;

public class JpaUtils {
	
	public static void addBetweenNumberPredicate(List<Predicate> predicates, final CriteriaBuilder cb,
			final Expression<BigDecimal> expression, BigDecimal valueFrom, BigDecimal valueTo) {
		addBetweenPredicate(predicates, cb, expression, valueFrom, valueTo);
	}
	
	public static void addBetweenNumberPredicate(List<Predicate> predicates, final CriteriaBuilder cb,
			final Expression<Integer> expression, Integer valueFrom, Integer valueTo) {
		addBetweenPredicate(predicates, cb, expression, valueFrom, valueTo);
	}
	
	public static void addBetweenNumberPredicate(List<Predicate> predicates, final CriteriaBuilder cb,
			final Expression<Double> expression, Double valueFrom, Double valueTo) {
		addBetweenPredicate(predicates, cb, expression, valueFrom, valueTo);
	}
	
	public static void addBetweenNumberPredicateAddNullPredicate(List<Predicate> predicates, final CriteriaBuilder cb,
			final Expression<Double> expression, Double valueFrom, Double valueTo) {
		
		if (valueFrom != null && valueFrom.equals(0d)) {
			List<Predicate> resultPredicates = new ArrayList<Predicate>();
			addBetweenPredicate(resultPredicates, cb, expression, valueFrom, valueTo);
			predicates.add(cb.or(resultPredicates.get(0), cb.isNull(expression)));
		} else {
			addBetweenPredicate(predicates, cb, expression, valueFrom, valueTo);
		}
	}
	
	public static void addBetweenDatePredicate(List<Predicate> predicates, final CriteriaBuilder cb,
			final Expression<Date> expressionFrom, Expression<Date> expressionTo, Date value) {
		addBetweenPredicate(predicates, cb, value, expressionFrom, expressionTo);
	}
	
	public static <T extends Comparable<? super T>> void addBetweenPredicate(List<Predicate> predicates,
			final CriteriaBuilder cb, T value, final Expression<T> expressionFrom, final Expression<T> expressionTo) {
		predicates.add(cb.lessThanOrEqualTo(expressionFrom, value));
		predicates.add(cb.greaterThanOrEqualTo(expressionTo, value));		
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
