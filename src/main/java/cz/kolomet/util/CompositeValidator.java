package cz.kolomet.util;

import java.util.List;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class CompositeValidator implements Validator {

	private List<Validator> validators;
	
	@Override
	public boolean supports(Class<?> clazz) {
		for (Validator validator: validators) {
			if (validator.supports(clazz)) {
				return true;
			}
		}
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		for (Validator validator: validators) {
			if (validator.supports(target.getClass())) {
				validator.validate(target, errors);
			}
		}
	}

	public List<Validator> getValidators() {
		return validators;
	}

	public void setValidators(List<Validator> validators) {
		this.validators = validators;
	}

}
