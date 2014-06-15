package cz.kolomet.validator;

import java.math.BigDecimal;
import java.util.Date;

import org.joda.time.DateTime;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import cz.kolomet.domain.Product;
import cz.kolomet.security.ApplicationUserDetails;

public class ProductValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return Product.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		Product product = (Product) target;
		
		Date validFrom = product.getValidFrom();
		Date validTo = product.getValidTo();
		
		if (ApplicationUserDetails.getActualApplicationUserDetails().isProductsOwn()) { 
			validateValidFrom(validFrom, product, errors);
			validateValidTo(validTo, errors);
		}
		validateValidDates(validFrom, validTo, errors);
		validatePrices(product.getFinalPrice(), product.getPrice(), errors);
	}
	
	private void validatePrices(BigDecimal finalPrice, BigDecimal originalPrice, Errors errors) {
		if (originalPrice != null) {
			if (originalPrice.compareTo(finalPrice) < 0) {
				errors.rejectValue("price", "product_original_price_low");
			}
		}
	}

	private void validateValidFrom(Date validFrom, Product product, Errors errors) {
		
		if (validFrom.before(new Date())) {
			errors.rejectValue("validFrom", "product_valid_from_before_now");
		}
		
		if (!product.isValidDateChangeable()) {
			errors.rejectValue("validFrom", "product_valid_from_after_two_hours_creation");
		}
	}
	
	private void validateValidTo(Date validTo, Errors errors) {
		
		Date tomorrow = new DateTime().plusDays(2).withTime(0, 0, 0, 0).toDate();
		if (validTo.before(tomorrow)) {
			errors.rejectValue("validTo", "product_valid_to_before_tomorrow");
		}
	}
	
	private void validateValidDates(Date validFrom, Date validTo, Errors errors) {
		if (validTo.before(validFrom)) {
			errors.rejectValue("validTo", "product_valid_to_before_valid_from");
		}
	}

}
