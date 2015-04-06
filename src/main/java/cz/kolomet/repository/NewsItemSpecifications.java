package cz.kolomet.repository;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.jpa.domain.Specification;

import cz.kolomet.domain.NewsItem;
import cz.kolomet.domain.NewsItemType;
import cz.kolomet.domain.codelist.Region;

public class NewsItemSpecifications {
	
	public static Specification<NewsItem> allNewsItems() {
		return new Specification<NewsItem>() {

			@Override
			public Predicate toPredicate(Root<NewsItem> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				
				List<Predicate> predicates = new ArrayList<Predicate>();
				predicates.add(cb.equal(root.get("enabled"), true));
				predicates.add(cb.or(cb.equal(root.get("newsItemType"), NewsItemType.NEWS_ITEM)));
				return cb.and(predicates.toArray(new Predicate[predicates.size()]));
			}
		};
	}
	
	public static Specification<NewsItem> partnerLinks(final Region region) {
		return new Specification<NewsItem>() {

			@Override
			public Predicate toPredicate(Root<NewsItem> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				
				List<Predicate> predicates = new ArrayList<Predicate>();
				predicates.add(cb.equal(root.get("enabled"), true));
				predicates.add(cb.equal(root.get("newsItemType"), NewsItemType.PARTNER_LINK));
				Join<NewsItem, Region> regionJoin = root.join("region", JoinType.LEFT);
				if (region != null) {
					predicates.add(
							cb.or(
									cb.equal(regionJoin, region), 
									cb.and(cb.isNull(regionJoin), cb.isFalse(root.<Boolean>get("missingRegion")))));
				} else {
					predicates.add(cb.or(cb.isNull(regionJoin), cb.isTrue(root.<Boolean>get("missingRegion"))));
				}
				return cb.and(predicates.toArray(new Predicate[predicates.size()]));
			}
		};
	}

	public static Specification<NewsItem> placesNewsBanners(final Region region) {
		return new Specification<NewsItem>() {

			@Override
			public Predicate toPredicate(Root<NewsItem> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				
				List<Predicate> predicates = new ArrayList<Predicate>();
				predicates.add(cb.equal(root.get("enabled"), true));
				predicates.add(cb.or(cb.equal(root.get("newsItemType"), NewsItemType.BANNER_PLACES),
						cb.equal(root.get("newsItemType"), NewsItemType.BANNER_ALL)));
				Join<NewsItem, Region> regionJoin = root.join("region", JoinType.LEFT);
				if (region != null) {
					predicates.add(
							cb.or(
									cb.equal(regionJoin, region), 
									cb.and(cb.isNull(regionJoin), cb.isFalse(root.<Boolean>get("missingRegion")))));
				} else {
					predicates.add(cb.or(cb.isNull(regionJoin), cb.isTrue(root.<Boolean>get("missingRegion"))));
				}
				return cb.and(predicates.toArray(new Predicate[predicates.size()]));
			}
		};
	}
	
	public static Specification<NewsItem> placesNewsBanners() {
		return placesNewsBanners(null);
	}

	public static Specification<NewsItem> productsNewsBanners() {
		return new Specification<NewsItem>() {

			@Override
			public Predicate toPredicate(Root<NewsItem> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				
				List<Predicate> predicates = new ArrayList<Predicate>();
				predicates.add(cb.equal(root.get("enabled"), true));
				predicates.add(cb.or(cb.equal(root.get("newsItemType"), NewsItemType.BANNER_PRODUCTS),
						cb.equal(root.get("newsItemType"), NewsItemType.BANNER_ALL)));
				return cb.and(predicates.toArray(new Predicate[predicates.size()]));
			}
		};
	}
	
	public static Specification<NewsItem> allNewsWeekendTips() {
		return new Specification<NewsItem>() {

			@Override
			public Predicate toPredicate(Root<NewsItem> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				
				List<Predicate> predicates = new ArrayList<Predicate>();
				predicates.add(cb.equal(root.get("enabled"), true));
				predicates.add(cb.or(cb.equal(root.get("newsItemType"), NewsItemType.WEEKEND_TIP)));
				return cb.and(predicates.toArray(new Predicate[predicates.size()]));
			}
		};
	}

}
