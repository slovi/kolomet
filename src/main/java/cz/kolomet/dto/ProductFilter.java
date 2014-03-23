package cz.kolomet.dto;

import java.math.BigDecimal;

import cz.kolomet.domain.Category;
import cz.kolomet.domain.Producer;

public class ProductFilter {
	
	private BigDecimal priceFrom;
	private BigDecimal priceTo;
	private Category category;
	private Producer producer;
	
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

}