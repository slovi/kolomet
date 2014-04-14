package cz.kolomet.web;

import java.text.ParseException;
import java.util.Locale;

import org.apache.commons.lang3.BooleanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.Formatter;
import org.springframework.format.FormatterRegistry;
import org.springframework.format.support.FormattingConversionServiceFactoryBean;
import org.springframework.roo.addon.web.mvc.controller.converter.RooConversionService;

import cz.kolomet.domain.ApplicationPermission;
import cz.kolomet.domain.ApplicationRole;
import cz.kolomet.domain.ApplicationUser;
import cz.kolomet.domain.Category;
import cz.kolomet.domain.Producer;
import cz.kolomet.domain.Product;
import cz.kolomet.domain.Seller;
import cz.kolomet.domain.codelist.CategoryType;
import cz.kolomet.domain.codelist.CountryState;
import cz.kolomet.domain.codelist.ProductAttributeType;
import cz.kolomet.domain.codelist.Region;
import cz.kolomet.domain.codelist.SellerStatus;
import cz.kolomet.service.SellerStatusService;

/**
 * A central place to register application converters and formatters. 
 */
@RooConversionService
public class ApplicationConversionServiceFactoryBean extends FormattingConversionServiceFactoryBean {

	@Autowired
	private SellerStatusService sellerStatusService;
	
	@Override
	@SuppressWarnings("deprecation")
	protected void installFormatters(FormatterRegistry registry) {
		super.installFormatters(registry);
		registry.addFormatter(getCountryStateFormatter());
		registry.addConverter(getSellerStatusToStringConverter());
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
                return new StringBuilder().append(product.getId()).toString();
            }
        };
    }
	
	public Converter<ProductAttributeType, String> getProductAttributeTypeToStringConverter() {
        return new Converter<ProductAttributeType, String>() {
            public String convert(ProductAttributeType productAttributeType) {
                return new StringBuilder().append(productAttributeType.getId()).toString();
            }
        };
    }
	
	public Converter<SellerStatus, String> getSellerStatusToStringConverter() {
        return new Converter<SellerStatus, String>() {
            public String convert(SellerStatus sellerStatus) {
                return new StringBuilder().append(sellerStatus.getCodeKey()).append(' ').append(sellerStatus.getCodeDescription()).toString();
            }
        };
    }
	
	public Converter<CountryState, String> getCountryStateToStringConverter() {
        return new Converter<cz.kolomet.domain.codelist.CountryState, java.lang.String>() {
            public String convert(CountryState countryState) {
                return new StringBuilder().append(countryState.getCodeKey()).append(' ').append(countryState.getCodeDescription()).toString();
            }
        };
    }
	
	public Converter<Long, SellerStatus> getIdToSellerStatusConverter() {
        return new Converter<Long, SellerStatus>() {
            public SellerStatus convert(Long id) {
                return sellerStatusService.findSellerStatus(id);
            }
        };
    }
	
	public Converter<Region, String> getRegionToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<cz.kolomet.domain.codelist.Region, java.lang.String>() {
            public String convert(Region region) {
                return new StringBuilder().append(region.getCodeKey()).append(' ').append(region.getCodeDescription()).toString();
            }
        };
    }
	
    public Converter<ApplicationRole, String> getApplicationRoleToStringConverter() {
        return new Converter<ApplicationRole, String>() {
            public String convert(ApplicationRole applicationRole) {
                return new StringBuilder().append(applicationRole.getRoleName()).toString();
            }
        };
    }
    
    public Converter<ApplicationUser, String> getApplicationUserToStringConverter() {
        return new Converter<ApplicationUser, String>() {
            public String convert(ApplicationUser applicationUser) {
                return new StringBuilder().append(applicationUser.getUsername()).toString();
            }
        };
    }
    
    public Converter<ApplicationPermission, String> getApplicationPermissionToStringConverter() {
        return new Converter<ApplicationPermission, String>() {
            public String convert(ApplicationPermission applicationPermission) {
                return new StringBuilder().append(applicationPermission.getPermissionName()).toString();
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
