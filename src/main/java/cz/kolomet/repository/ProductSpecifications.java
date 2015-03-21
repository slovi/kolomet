package cz.kolomet.repository;

import static cz.kolomet.util.db.JpaUtils.addBetweenNumberPredicate;
import static cz.kolomet.util.db.JpaUtils.addBetweenNumberPredicateAddNullPredicate;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.persistence.criteria.Subquery;

import org.apache.commons.lang3.BooleanUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.data.jpa.domain.Specification;

import cz.kolomet.domain.Category;
import cz.kolomet.domain.Producer;
import cz.kolomet.domain.Product;
import cz.kolomet.domain.Seller;
import cz.kolomet.domain.codelist.CategoryType;
import cz.kolomet.domain.codelist.FigureHeight;
import cz.kolomet.domain.codelist.ProductColor;
import cz.kolomet.domain.codelist.Region;
import cz.kolomet.dto.AdminProductFilterDto;
import cz.kolomet.dto.ProductFilterDto;
import cz.kolomet.util.db.JpaUtils;

public class ProductSpecifications {
	
	public static Sort getDefaultSort() {
    	Order createdOrder = new Order(Direction.DESC, "id");
    	return new Sort(createdOrder);
	}
	
	public static Sort getDefaultSort(Sort addSort) {
		if (addSort != null && addSort.getOrderFor("id") != null) {
			return addSort;
		} else {
	    	Order idOrder = new Order(Direction.DESC, "id");
	    	Sort defaultSort = new Sort(idOrder);
	    	return addSort.and(defaultSort);
		}
	}
	
	public static Specification<Product> forAdminProductFiter(final AdminProductFilterDto productFilter, final Long sellerId) {
		return new Specification<Product>() {

			@Override
			public Predicate toPredicate(Root<Product> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				
				List<Predicate> predicates = new ArrayList<Predicate>();
				
				if (StringUtils.isNotEmpty(productFilter.getName())) {
					predicates.add(cb.like(root.<String> get("productName"), "%" + productFilter.getName() + "%"));
				}
				if (productFilter.getValidFrom() != null) {
					predicates.add(cb.greaterThanOrEqualTo(root.<Date> get("validFrom"), productFilter.getValidFrom()));
				}
				if (productFilter.getValidTo() != null) {
					predicates.add(cb.lessThanOrEqualTo(root.<Date> get("validTo"), productFilter.getValidTo()));
				}
				if (sellerId != null) {
					Join<Product, Seller> seller = root.join("seller");
					predicates.add(cb.equal(seller.<Long> get("id"), sellerId));
				}
				return cb.and(predicates.toArray(new Predicate[predicates.size()]));
			}
		};
	}
	
	public static Specification<Product> forProductFilter(final ProductFilterDto productFilter) {
		return new Specification<Product>() {

			@Override
			public Predicate toPredicate(Root<Product> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				
				List<Predicate> predicates = new ArrayList<Predicate>();
				addBetweenNumberPredicate(predicates, cb, root.<BigDecimal> get("finalPrice"), productFilter.getPriceFrom(), productFilter.getPriceTo());
				addBetweenNumberPredicate(predicates, cb, root.<BigDecimal> get("discount"), productFilter.getDiscountFrom(), productFilter.getDiscountTo());
				addBetweenNumberPredicateAddNullPredicate(predicates, cb, root.<Double> get("weight"), productFilter.getWeightFrom(), productFilter.getWeightTo());
				
				if (productFilter.getCategory() != null && !productFilter.getCategory().getCodeKey().equals(Category.ALL_CATEGORY_CODE_KEY)) {
					predicates.add(cb.equal(root.get("category"), productFilter.getCategory()));
				}
				if (productFilter.getProducer() != null) {
					Join<Product, Producer> producerJoin = root.join("producer");
					predicates.add(cb.equal(producerJoin, productFilter.getProducer()));
				}
				if (BooleanUtils.isTrue(productFilter.getCanSendToAllCountry())) {
					predicates.add(cb.equal(root.get("canSendToAllCountry"), true));
				}
				if (productFilter.getRegion() != null) {
					Subquery<Region> regionSubquery = query.subquery(Region.class);
					Root<Seller> regionSubqueryRoot = regionSubquery.from(Seller.class);
					regionSubquery.select(regionSubqueryRoot.<Region> get("region"));
					regionSubquery.where(cb.equal(regionSubqueryRoot, root.get("seller")));
					predicates.add(cb.equal(regionSubquery, productFilter.getRegion()));
				}
				if (productFilter.getProductUsage() != null) {
					predicates.add(cb.equal(root.get("productUsage"), productFilter.getProductUsage()));
				}
				if (productFilter.getFigureHeight() != null) {
					predicates.add(cb.isMember(productFilter.getFigureHeight(), root.<Collection<FigureHeight>> get("figureHeights")));
				}
				if (productFilter.getProductColor() != null) {
					predicates.add(cb.isMember(productFilter.getProductColor(), root.<Collection<ProductColor>> get("productColors")));
				}
				if (productFilter.getBicycleCategory() != null) {
					predicates.add(cb.equal(root.get("bicycleCategory"), productFilter.getBicycleCategory()));
				}
				if (productFilter.getSeller() != null) {
					predicates.add(cb.equal(root.get("seller"), productFilter.getSeller()));
				}
				if (productFilter.getCategoryType() != null) {
					Subquery<CategoryType> categoryTypeSubquery = query.subquery(CategoryType.class);
					Root<Product> categoryTypeRoot = categoryTypeSubquery.from(Product.class);
					Join<Product, Category> categoryRoot = categoryTypeRoot.join("category");
					categoryTypeSubquery.select(categoryRoot.<CategoryType>get("categoryType"));			
					categoryTypeSubquery.where(cb.equal(categoryTypeRoot, root));
					predicates.add(cb.equal(categoryTypeSubquery, productFilter.getCategoryType()));
				}
				
				Subquery<Boolean> sellerEnabledSubquery = query.subquery(Boolean.class);
				Root<Seller> sellerEnabledSubqueryRoot = sellerEnabledSubquery.from(Seller.class);
				sellerEnabledSubquery.select(sellerEnabledSubqueryRoot.<Boolean> get("enabled"));
				sellerEnabledSubquery.where(cb.equal(sellerEnabledSubqueryRoot, root.get("seller")));
				predicates.add(cb.equal(sellerEnabledSubquery, true));

				JpaUtils.addBetweenDatePredicate(predicates, cb, root.<Date> get("validFrom"), root.<Date> get("validTo"), new Date());
				return cb.and(predicates.toArray(new Predicate[predicates.size()]));
			}
		};
	}

}