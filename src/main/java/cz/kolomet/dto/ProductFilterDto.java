package cz.kolomet.dto;

import java.math.BigDecimal;

import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;

import cz.kolomet.domain.Category;
import cz.kolomet.domain.Producer;
import cz.kolomet.domain.codelist.BicycleCategory;
import cz.kolomet.domain.codelist.CategoryType;
import cz.kolomet.domain.codelist.FigureHeight;
import cz.kolomet.domain.codelist.ProductUsage;
import cz.kolomet.domain.codelist.Region;

public class ProductFilterDto {
	
	@NumberFormat(style = Style.NUMBER)
	private BigDecimal priceFrom;
	
	@NumberFormat(style = Style.NUMBER)
	private BigDecimal priceTo;
	
	private BigDecimal maxPriceTo;
	
	@NumberFormat(style = Style.NUMBER)
	private BigDecimal discountFrom;
	
	@NumberFormat(style = Style.NUMBER)
	private BigDecimal discountTo;
	
	private BigDecimal maxDiscountTo;
	
	@NumberFormat(style = Style.NUMBER)
	private Integer weightFrom;
	
	@NumberFormat(style = Style.NUMBER)
	private Integer weightTo;
	
	private Integer maxWeightTo;
	
	private Category category;
	
	private CategoryType categoryType;
	
	private Producer producer;
	
	private Region region;
	
	private ProductUsage productUsage;
	
	private BicycleCategory bicycleCategory;
	
	private FigureHeight figureHeight;
	
	private Boolean canSendToAllCountry;
	
	public ProductFilterDto() {
	}
	
	public static ProductFilterDto initEmpty() {
		return initEmpty(new BigDecimal(100000l), new BigDecimal(10000l), 50);
	}
	
	public static ProductFilterDto initEmpty(BigDecimal maxPriceTo, BigDecimal maxDiscountTo, Integer maxWeightTo) {
		ProductFilterDto productFilter = new ProductFilterDto();
		productFilter.category = new Category();
		productFilter.category.setId(0l);
		productFilter.categoryType = new CategoryType();
		productFilter.categoryType.setId(0l);
		productFilter.region = new Region();
		productFilter.region.setId(0l);
		productFilter.producer = new Producer();
		productFilter.producer.setId(0l);
		productFilter.productUsage = new ProductUsage();
		productFilter.productUsage.setId(0l);
		productFilter.bicycleCategory = new BicycleCategory();
		productFilter.bicycleCategory.setId(0l);
		productFilter.figureHeight = new FigureHeight();
		productFilter.figureHeight.setId(0l);
		productFilter.priceFrom = new BigDecimal(0l);
		productFilter.priceTo = maxPriceTo;
		productFilter.maxPriceTo = maxPriceTo;
		productFilter.discountFrom = new BigDecimal(0l);
		productFilter.discountTo = maxDiscountTo;
		productFilter.maxDiscountTo = maxDiscountTo;
		productFilter.weightFrom = 0;
		productFilter.weightTo = maxWeightTo;
		productFilter.maxWeightTo = maxWeightTo;
		return productFilter;
	}
	
	public BigDecimal getPriceFrom() {
		return priceFrom;
	}
	
	public void setPriceFrom(BigDecimal priceFrom) {
		this.priceFrom = priceFrom;
	}
	
	public BigDecimal getPriceTo() {
		return priceTo;
	}
	
	public void setPriceTo(BigDecimal priceTo) {
		this.priceTo = priceTo;
	}
	
	public BigDecimal getDiscountFrom() {
		return discountFrom;
	}

	public void setDiscountFrom(BigDecimal discountFrom) {
		this.discountFrom = discountFrom;
	}

	public BigDecimal getDiscountTo() {
		return discountTo;
	}

	public void setDiscountTo(BigDecimal discountTo) {
		this.discountTo = discountTo;
	}

	public Integer getWeightFrom() {
		return weightFrom;
	}

	public void setWeightFrom(Integer weightFrom) {
		this.weightFrom = weightFrom;
	}

	public Integer getWeightTo() {
		return weightTo;
	}

	public void setWeightTo(Integer weightTo) {
		this.weightTo = weightTo;
	}

	public Category getCategory() {
		return category;
	}
	
	public void setCategory(Category category) {
		this.category = category;
	}

	public CategoryType getCategoryType() {
		return categoryType;
	}

	public void setCategoryType(CategoryType categoryType) {
		this.categoryType = categoryType;
	}

	public Producer getProducer() {
		return producer;
	}

	public void setProducer(Producer producer) {
		this.producer = producer;
	}

	public Region getRegion() {
		return region;
	}

	public void setRegion(Region region) {
		this.region = region;
	}

	public ProductUsage getProductUsage() {
		return productUsage;
	}

	public void setProductUsage(ProductUsage productUsage) {
		this.productUsage = productUsage;
	}

	public BicycleCategory getBicycleCategory() {
		return bicycleCategory;
	}

	public void setBicycleCategory(BicycleCategory bicycleCategory) {
		this.bicycleCategory = bicycleCategory;
	}

	public FigureHeight getFigureHeight() {
		return figureHeight;
	}

	public void setFigureHeight(FigureHeight figureHeight) {
		this.figureHeight = figureHeight;
	}

	public Boolean getCanSendToAllCountry() {
		return canSendToAllCountry;
	}

	public void setCanSendToAllCountry(Boolean canSendToAllCountry) {
		this.canSendToAllCountry = canSendToAllCountry;
	}

	public BigDecimal getMaxPriceTo() {
		return maxPriceTo;
	}

	public void setMaxPriceTo(BigDecimal maxPriceTo) {
		this.maxPriceTo = maxPriceTo;
	}

	public BigDecimal getMaxDiscountTo() {
		return maxDiscountTo;
	}

	public void setMaxDiscountTo(BigDecimal maxDiscountTo) {
		this.maxDiscountTo = maxDiscountTo;
	}

	public Integer getMaxWeightTo() {
		return maxWeightTo;
	}

	public void setMaxWeightTo(Integer maxWeightTo) {
		this.maxWeightTo = maxWeightTo;
	}

}