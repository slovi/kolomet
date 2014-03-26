package cz.kolomet.web;

import java.text.ParseException;
import java.util.Locale;

import org.springframework.core.convert.converter.Converter;
import org.springframework.format.Formatter;
import org.springframework.format.FormatterRegistry;
import org.springframework.format.support.FormattingConversionServiceFactoryBean;
import org.springframework.roo.addon.web.mvc.controller.converter.RooConversionService;

import cz.kolomet.domain.Category;
import cz.kolomet.domain.Producer;
import cz.kolomet.domain.Product;
import cz.kolomet.domain.Seller;
import cz.kolomet.domain.codelist.CategoryType;
import cz.kolomet.domain.codelist.CountryState;
import cz.kolomet.domain.codelist.ProductAttributeType;

/**
 * A central place to register application converters and formatters. 
 */
@RooConversionService
public class ApplicationConversionServiceFactoryBean extends FormattingConversionServiceFactoryBean {

	
	@Override
	@SuppressWarnings("deprecation")
	protected void installFormatters(FormatterRegistry registry) {
		super.installFormatters(registry);
		registry.addFormatter(getCountryStateFormatter());
	}
	
	public Converter<Seller, String> getSellerToStringConverter() {
        return new Converter<Seller, String>() {
            public String convert(Seller seller) {
                return new StringBuilder().append(seller.getSellerName()).toString();
            }
        };
    }
	
	public Converter<Category, String> getCategoryToStringConverter() {
        return new Converter<Category, String>() {
            public String convert(Category category) {
                return new StringBuilder().append(category.getCodeDescription()).toString();
            }
        };
    }
	
	public Converter<Producer, String> getProducerToStringConverter() {
        return new Converter<Producer, String>() {
            public String convert(Producer producer) {
                return new StringBuilder().append(producer.getCodeDescription()).toString();
            }
        };
    }
	
	public Converter<CategoryType, String> getCategoryTypeToStringConverter() {
        return new Converter<CategoryType, String>() {
            public String convert(CategoryType categoryType) {
                return new StringBuilder().append(categoryType.getCodeDescription()).toString();
            }
        };
    }
	
	public Converter<Product, String> getProductToStringConverter() {
        return new Converter<Product, String>() {
            public String convert(Product product) {
                return new StringBuilder().append(product.getProductName()).append(' ').append(product.getSeller().getSellerName()).toString();
            }
        };
    }
	
	public Converter<ProductAttributeType, String> getProductAttributeTypeToStringConverter() {
        return new Converter<ProductAttributeType, String>() {
            public String convert(ProductAttributeType productAttributeType) {
                return new StringBuilder().append(productAttributeType.getCodeDescription()).toString();
            }
        };
    }
	
	// formatters
	
	public Formatter<CountryState> getCountryStateFormatter() {
		return new Formatter<CountryState>() {
	
			@Override
			public String print(CountryState object, Locale locale) {
				return object.getCodeDescription();
			}
	
			@Override
			public CountryState parse(String text, Locale locale) throws ParseException {
				throw new UnsupportedOperationException();
			}
		};
	}
	
}
