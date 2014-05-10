package cz.kolomet.repository;

import static cz.kolomet.util.db.JpaUtils.addBetweenNumberPredicate;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.lang3.BooleanUtils;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.data.jpa.domain.Specification;

import cz.kolomet.domain.Category;
import cz.kolomet.domain.Producer;
import cz.kolomet.domain.Product;
import cz.kolomet.domain.Seller;
import cz.kolomet.domain.codelist.Region;
import cz.kolomet.dto.ProductFilterDto;

public class ProductSpecifications {
	
	public static Sort getDefaultSort() {
		Order priorityOrder = new Order(Direction.DESC, "seller.sellerStatus.priority");
    	Order createdOrder = new Order(Direction.DESC, "created");
    	return new Sort(priorityOrder, createdOrder);
	}
	
	public static Sort getDefaultSort(Sort addSort) {
    	Order priorityOrder = new Order(Direction.DESC, "seller.sellerStatus.priority");
    	Order createdOrder = new Order(Direction.DESC, "created");
    	Sort defaultSort = new Sort(priorityOrder, createdOrder);
    	return addSort.and(defaultSort);
	}
	
	public static Specification<Product> forProductFilter(final ProductFilterDto productFilter) {
		return new Specification<Product>() {

			@Override
			public Predicate toPredicate(Root<Product> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				
				List<Predicate> predicates = new ArrayList<Predicate>();
				addBetweenNumberPredicate(predicates, cb, root.<BigDecimal> get("price"), productFilter.getPriceFrom(), productFilter.getPriceTo());
				addBetweenNumberPredicate(predicates, cb, root.<BigDecimal> get("discount"), productFilter.getDiscountFrom(), productFilter.getDiscountTo());
				addBetweenNumberPredicate(predicates, cb, root.<Integer> get("weight"), productFilter.getWeightFrom(), productFilter.getWeightTo());
				
				if (productFilter.getCategory() != null && !productFilter.getCategory().getCodeKey().equals(Category.ALL_CATEGORY_CODE_KEY)) {
					predicates.add(cb.equal(root.get("category"), productFilter.getCategory()));
				}
				if (productFilter.getProducer() != null) {
					Join<Product, Producer> producerJoin = root.join("producer");
					predicates.add(cb.equal(producerJoin, productFilter.getProducer()));
				}
				Join<Product, Seller> seller = root.join("seller");
				if (BooleanUtils.isTrue(productFilter.getCanSendToAllCountry())) {
					predicates.add(cb.equal(root.get("canSendToAllCountry"), true));
				}
				if (productFilter.getRegion() != null) {
					Join<Seller, Region> region = seller.join("region");
					predicates.add(cb.equal(region, productFilter.getRegion()));
				}
				if (productFilter.getProductUsage() != null) {
					predicates.add(cb.equal(root.get("productUsage"), productFilter.getProductUsage()));
				}
				if (productFilter.getFigureHeight() != null) {
					predicates.add(cb.equal(root.get("figureHeight"), productFilter.getFigureHeight()));
				}
				if (productFilter.getBicycleCategory() != null) {
					predicates.add(cb.equal(root.get("bicycleCategory"), productFilter.getBicycleCategory()));
				}
				if (productFilter.getCategoryType() != null) {
					Join<Product, Category> category = root.join("category");
					predicates.add(cb.equal(category.get("categoryType"), productFilter.getCategoryType()));
				}
				predicates.add(cb.equal(seller.get("enabled"), true));
				return cb.and(predicates.toArray(new Predicate[predicates.size()]));
			}
		};
	}

}