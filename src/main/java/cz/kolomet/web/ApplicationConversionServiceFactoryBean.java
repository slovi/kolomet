package cz.kolomet.web;

import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;
import org.springframework.format.support.FormattingConversionServiceFactoryBean;
import org.springframework.roo.addon.web.mvc.controller.converter.RooConversionService;

import cz.kolomet.domain.Seller;
import cz.kolomet.domain.codelist.Category;
import cz.kolomet.domain.codelist.CategoryType;
import cz.kolomet.domain.codelist.Producer;

/**
 * A central place to register application converters and formatters. 
 */
@RooConversionService
public class ApplicationConversionServiceFactoryBean extends FormattingConversionServiceFactoryBean {

	@Override
	protected void installFormatters(FormatterRegistry registry) {
		super.installFormatters(registry);
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
	
}
