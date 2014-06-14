package cz.kolomet.validator;

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
	}

	private void validateValidFrom(Date validFrom, Product product, Errors errors) {
		
		if (validFrom.before(new Date())) {
			errors.rejectValue("validFrom", "valid_from_before_now");
		}
		
		if (!product.isValidDateChangeable()) {
			errors.rejectValue("validFrom", "valid_from_after_two_hours_creation");
		}
	}
	
	private void validateValidTo(Date validTo, Errors errors) {
		
		Date tomorrow = new DateTime().plusDays(2).withTime(0, 0, 0, 0).toDate();
		if (validTo.before(tomorrow)) {
			errors.rejectValue("validTo", "valid_to_before_tomorrow");
		}
	}

}
