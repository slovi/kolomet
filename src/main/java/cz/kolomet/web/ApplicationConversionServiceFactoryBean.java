package cz.kolomet.web;

import java.text.ParseException;
import java.util.Locale;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.Formatter;
import org.springframework.format.FormatterRegistry;
import org.springframework.format.support.FormattingConversionServiceFactoryBean;
import org.springframework.roo.addon.web.mvc.controller.converter.RooConversionService;

import cz.kolomet.domain.Address;
import cz.kolomet.domain.ApplicationPermission;
import cz.kolomet.domain.ApplicationRole;
import cz.kolomet.domain.ApplicationUser;
import cz.kolomet.domain.Category;
import cz.kolomet.domain.GpsLocation;
import cz.kolomet.domain.Producer;
import cz.kolomet.domain.Product;
import cz.kolomet.domain.Seller;
import cz.kolomet.domain.codelist.CategoryType;
import cz.kolomet.domain.codelist.CountryState;
import cz.kolomet.domain.codelist.PlaceType;
import cz.kolomet.domain.codelist.ProductAttributeType;
import cz.kolomet.domain.codelist.Region;
import cz.kolomet.domain.codelist.SellerStatus;
import cz.kolomet.service.RegionService;
import cz.kolomet.service.SellerStatusService;

/**
 * A central place to register application converters and formatters. 
 */
@RooConversionService
public class ApplicationConversionServiceFactoryBean extends FormattingConversionServiceFactoryBean {

	@Autowired
	private SellerStatusService sellerStatusService;
	
	@Autowired
	private RegionService regionService;
	
	@Override
	@SuppressWarnings("deprecation")
	protected void installFormatters(FormatterRegistry registry) {
		super.installFormatters(registry);
		registry.addFormatter(getCountryStateFormatter());
		registry.addFormatter(getGpsLocationFormatter());
		registry.addFormatter(getAddressFormatter());
		registry.addConverter(getSellerStatusToStringConverter());
	}
	
	public Converter<PlaceType, String> getPlaceTypeToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<cz.kolomet.domain.codelist.PlaceType, java.lang.String>() {
            public String convert(PlaceType placeType) {
                return new StringBuilder().append(placeType.getId()).toString();
            }
        };
    }
	
	public Converter<Seller, String> getSellerToStringConverter() {
        return new Converter<Seller, String>() {
            public String convert(Seller seller) {
                return new StringBuilder().append(seller.getId()).toString();
            }
        };
    }
	
	public Converter<Category, String> getCategoryToStringConverter() {
        return new Converter<Category, String>() {
            public String convert(Category category) {
                return new StringBuilder().append(category.getId()).toString();
            }
        };
    }
	
	public Converter<Producer, String> getProducerToStringConverter() {
        return new Converter<Producer, String>() {
            public String convert(Producer producer) {
                return new StringBuilder().append(producer.getId()).toString();
            }
        };
    }
	
	public Converter<CategoryType, String> getCategoryTypeToStringConverter() {
        return new Converter<CategoryType, String>() {
            public String convert(CategoryType categoryType) {
                return new StringBuilder().append(categoryType.getId()).toString();
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
                return new StringBuilder().append(sellerStatus.getId()).toString();
            }
        };
    }
	
	public Converter<CountryState, String> getCountryStateToStringConverter() {
        return new Converter<cz.kolomet.domain.codelist.CountryState, java.lang.String>() {
            public String convert(CountryState countryState) {
                return new StringBuilder().append(countryState.getId()).toString();
            }
        };
    }
	
    public Converter<String, Region> getStringToRegionConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.codelist.Region>() {
            public cz.kolomet.domain.codelist.Region convert(String id) {
            	
            	try {
            		Long parsedId = Long.parseLong(id);
            		return regionService.findRegion(parsedId);
            	} catch (Exception e) {
            		// id is google alias
            		return regionService.findByGoogleAlias(id);
            	}
            }
        };
    }
	
	public Converter<Region, String> getRegionToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<cz.kolomet.domain.codelist.Region, java.lang.String>() {
            public String convert(Region region) {
                return new StringBuilder().append(region.getGoogleAlias()).toString();
            }
        };
    }
	
    public Converter<ApplicationRole, String> getApplicationRoleToStringConverter() {
        return new Converter<ApplicationRole, String>() {
            public String convert(ApplicationRole applicationRole) {
                return new StringBuilder().append(applicationRole.getId()).toString();
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
	
	public Formatter<GpsLocation> getGpsLocationFormatter() {
		return new Formatter<GpsLocation>() {

			@Override
			public String print(GpsLocation object, Locale locale) {
				return "[" + object.getNorth() + ", " + object.getWest() + "]";
			}

			@Override
			public GpsLocation parse(String text, Locale locale) throws ParseException {
				throw new UnsupportedOperationException();
			}
		};
	}
	
	public Formatter<Address> getAddressFormatter() {
		return new Formatter<Address>() {

			@Override
			public String print(Address object, Locale locale) {
				StringBuilder builder = new StringBuilder();
		    	if (StringUtils.isNotEmpty(object.getStreet())) {
		    		builder.append(object.getStreet());
		    		if (object.getHouseNr() != null) {
		    			builder.append(" ");
		    			builder.append(object.getStreet());
		    		}
		    		builder.append(", ");
		    	}
		    	if (StringUtils.isNotEmpty(object.getCity())) {
		    		builder.append(object.getCity());
		    		builder.append(", ");
		    	}
		    	if (StringUtils.isNotEmpty(object.getZipCode())) {
		    		builder.append(object.getZipCode());
		    	}
		    	return builder.toString();
			}

			@Override
			public Address parse(String text, Locale locale) throws ParseException {
				throw new UnsupportedOperationException();
			}
		};
	}
	
}