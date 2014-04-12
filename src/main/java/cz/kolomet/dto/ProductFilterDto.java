package cz.kolomet.dto;

import java.math.BigDecimal;

import cz.kolomet.domain.Category;
import cz.kolomet.domain.Producer;
import cz.kolomet.domain.codelist.Region;

public class ProductFilterDto {
	
	private BigDecimal priceFrom;
	private BigDecimal priceTo;
	private BigDecimal discountFrom;
	private BigDecimal discountTo;
	private BigDecimal weightFrom;
	private BigDecimal weightTo;
	private Category category;
	private Producer producer;
	private Region region;
	private Boolean canSendToAllCountry;
	
	public ProductFilterDto() {
		this.category = new Category();
		this.category.setId(0l);
		this.region = new Region();
		this.region.setId(0l);
		this.producer = new Producer();
		this.producer.setId(0l);
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

	public BigDecimal getWeightFrom() {
		return weightFrom;
	}

	public void setWeightFrom(BigDecimal weightFrom) {
		this.weightFrom = weightFrom;
	}

	public BigDecimal getWeightTo() {
		return weightTo;
	}

	public void setWeightTo(BigDecimal weightTo) {
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

	public Boolean getCanSendToAllCountry() {
		return canSendToAllCountry;
	}

	public void setCanSendToAllCountry(Boolean canSendToAllCountry) {
		this.canSendToAllCountry = canSendToAllCountry;
	}

}