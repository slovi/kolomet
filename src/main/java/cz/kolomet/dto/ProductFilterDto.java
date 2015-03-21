package cz.kolomet.dto;

import java.math.BigDecimal;

import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;

import cz.kolomet.domain.Category;
import cz.kolomet.domain.Producer;
import cz.kolomet.domain.Seller;
import cz.kolomet.domain.codelist.BicycleCategory;
import cz.kolomet.domain.codelist.CategoryType;
import cz.kolomet.domain.codelist.FigureHeight;
import cz.kolomet.domain.codelist.ProductColor;
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
	private Double weightFrom;
	
	@NumberFormat(style = Style.NUMBER)
	private Double weightTo;
	
	private Double maxWeightTo;
	
	private Category category;
	
	private CategoryType categoryType;
	
	private Producer producer;
	
	private Region region;
	
	private ProductUsage productUsage;
	
	private BicycleCategory bicycleCategory;
	
	private FigureHeight figureHeight;
	
	private ProductColor productColor;
	
	private Seller seller;
	
	private Boolean canSendToAllCountry;
	
	public ProductFilterDto() {
	}
	
	public static ProductFilterDto initEmpty() {
		return initEmpty(new BigDecimal(100000l), new BigDecimal(10000l), 50);
	}
	
	public static ProductFilterDto initEmpty(BigDecimal maxPriceTo, BigDecimal maxDiscountTo, Integer maxWeightTo) {
		ProductFilterDto productFilter = new ProductFilterDto();
		productFilter.priceFrom = new BigDecimal(0l);
		productFilter.priceTo = maxPriceTo;
		productFilter.maxPriceTo = maxPriceTo;
		productFilter.discountFrom = new BigDecimal(0l);
		productFilter.discountTo = maxDiscountTo;
		productFilter.maxDiscountTo = maxDiscountTo;
		productFilter.weightFrom = 0d;
		productFilter.weightTo = maxWeightTo.doubleValue();
		productFilter.maxWeightTo = maxWeightTo.doubleValue();
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

	public Double getWeightFrom() {
		return weightFrom;
	}

	public void setWeightFrom(Double weightFrom) {
		this.weightFrom = weightFrom;
	}

	public Double getWeightTo() {
		return weightTo;
	}

	public void setWeightTo(Double weightTo) {
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

	public ProductColor getProductColor() {
		return productColor;
	}

	public void setProductColor(ProductColor productColor) {
		this.productColor = productColor;
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

	public Double getMaxWeightTo() {
		return maxWeightTo;
	}

	public void setMaxWeightTo(Double maxWeightTo) {
		this.maxWeightTo = maxWeightTo;
	}

	public Seller getSeller() {
		return seller;
	}

	public void setSeller(Seller seller) {
		this.seller = seller;
	}

}