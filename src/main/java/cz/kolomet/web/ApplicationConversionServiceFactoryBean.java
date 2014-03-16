package cz.kolomet.web;

import java.text.ParseException;
import java.util.Locale;

import org.springframework.format.Formatter;
import org.springframework.format.FormatterRegistry;
import org.springframework.format.support.FormattingConversionServiceFactoryBean;
import org.springframework.roo.addon.web.mvc.controller.converter.RooConversionService;

import cz.kolomet.domain.Address;

/**
 * A central place to register application converters and formatters. 
 */
@RooConversionService
public class ApplicationConversionServiceFactoryBean extends FormattingConversionServiceFactoryBean {

	@Override
	protected void installFormatters(FormatterRegistry registry) {
		super.installFormatters(registry);
		registry.addFormatter(new AddressFormatter());
		// Register application converters and formatters
	}
	
	static class AddressFormatter implements Formatter<Address> {

		@Override
		public String print(Address object, Locale locale) {
			return object.getStreet() + " " + object.getStreetNr() + " " + object.getCity() + " " + object.getPostCode();
		}

		@Override
		public Address parse(String text, Locale locale) throws ParseException {
			throw new UnsupportedOperationException();
		}
		
	}
	
}
