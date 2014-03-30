package cz.kolomet.repository;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.jpa.domain.Specification;

import cz.kolomet.domain.NewsItem;

public class NewsItemSpecifications {
	
	public static Specification<NewsItem> allNewsItems() {
		return new Specification<NewsItem>() {

			@Override
			public Predicate toPredicate(Root<NewsItem> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				
				List<Predicate> predicates = new ArrayList<Predicate>();
				cb.lessThan(root.<Date>get("newsItemDate"), new Date());
				cb.equal(root.get("enabled"), true);
				return cb.and(predicates.toArray(new Predicate[predicates.size()]));
			}
		};
	}

}
