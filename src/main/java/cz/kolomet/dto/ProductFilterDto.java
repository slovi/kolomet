package cz.kolomet.dto;

import java.math.BigDecimal;

import cz.kolomet.domain.Category;
import cz.kolomet.domain.Producer;
import cz.kolomet.domain.codelist.BicycleSize;
import cz.kolomet.domain.codelist.FigureHeight;
import cz.kolomet.domain.codelist.ProductUsage;
import cz.kolomet.domain.codelist.Region;

public class ProductFilterDto {
	
	private BigDecimal priceFrom;
	private BigDecimal priceTo;
	private BigDecimal discountFrom;
	private BigDecimal discountTo;
	private Integer weightFrom;
	private Integer weightTo;
	private Category category;
	private Producer producer;
	private Region region;
	private ProductUsage productUsage;
	private BicycleSize bicycleSize;
	private FigureHeight figureHeight;
	private Boolean canSendToAllCountry;
	
	public ProductFilterDto() {
	}
	
	public ProductFilterDto(boolean initEmpty) {
		if (initEmpty) {
			this.category = new Category();
			this.category.setId(0l);
			this.region = new Region();
			this.region.setId(0l);
			this.producer = new Producer();
			this.producer.setId(0l);
			this.productUsage = new ProductUsage();
			this.productUsage.setId(0l);
			this.bicycleSize = new BicycleSize();
			this.bicycleSize.setId(0l);
			this.figureHeight = new FigureHeight();
			this.figureHeight.setId(0l);
		}
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

	public BicycleSize getBicycleSize() {
		return bicycleSize;
	}

	public void setBicycleSize(BicycleSize bicycleSize) {
		this.bicycleSize = bicycleSize;
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

}