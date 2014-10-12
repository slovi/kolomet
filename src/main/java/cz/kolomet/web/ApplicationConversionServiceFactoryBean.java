package cz.kolomet.web;

import java.text.ParseException;
import java.util.Locale;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.Formatter;
import org.springframework.format.FormatterRegistry;
import org.springframework.format.support.FormattingConversionServiceFactoryBean;

import cz.kolomet.domain.Address;
import cz.kolomet.domain.ApplicationPermission;
import cz.kolomet.domain.ApplicationRole;
import cz.kolomet.domain.ApplicationUser;
import cz.kolomet.domain.Category;
import cz.kolomet.domain.GpsLocation;
import cz.kolomet.domain.NewsItem;
import cz.kolomet.domain.NewsItemPhotoUrl;
import cz.kolomet.domain.PhotoUrl;
import cz.kolomet.domain.Place;
import cz.kolomet.domain.PlaceComment;
import cz.kolomet.domain.PlacePhotoUrl;
import cz.kolomet.domain.Producer;
import cz.kolomet.domain.Product;
import cz.kolomet.domain.ProductAttribute;
import cz.kolomet.domain.Rate;
import cz.kolomet.domain.RegistrationRequest;
import cz.kolomet.domain.Seller;
import cz.kolomet.domain.SellerPhotoUrl;
import cz.kolomet.domain.codelist.BicycleCategory;
import cz.kolomet.domain.codelist.CategoryType;
import cz.kolomet.domain.codelist.CountryState;
import cz.kolomet.domain.codelist.FigureHeight;
import cz.kolomet.domain.codelist.PlaceType;
import cz.kolomet.domain.codelist.ProductAttributeType;
import cz.kolomet.domain.codelist.ProductColor;
import cz.kolomet.domain.codelist.ProductUsage;
import cz.kolomet.domain.codelist.Region;
import cz.kolomet.domain.codelist.SellerStatus;
import cz.kolomet.dto.FileInfo;
import cz.kolomet.service.ApplicationPermissionService;
import cz.kolomet.service.ApplicationRoleService;
import cz.kolomet.service.ApplicationUserService;
import cz.kolomet.service.BicycleCategoryService;
import cz.kolomet.service.CategoryService;
import cz.kolomet.service.CategoryTypeService;
import cz.kolomet.service.CountryStateService;
import cz.kolomet.service.FigureHeightService;
import cz.kolomet.service.NewsItemPhotoUrlService;
import cz.kolomet.service.NewsItemService;
import cz.kolomet.service.PhotoUrlService;
import cz.kolomet.service.PlaceCommentService;
import cz.kolomet.service.PlacePhotoUrlService;
import cz.kolomet.service.PlaceService;
import cz.kolomet.service.PlaceTypeService;
import cz.kolomet.service.ProducerService;
import cz.kolomet.service.ProductAttributeService;
import cz.kolomet.service.ProductAttributeTypeService;
import cz.kolomet.service.ProductColorService;
import cz.kolomet.service.ProductService;
import cz.kolomet.service.ProductUsageService;
import cz.kolomet.service.RateService;
import cz.kolomet.service.RegionService;
import cz.kolomet.service.RegistrationRequestService;
import cz.kolomet.service.SellerPhotoUrlService;
import cz.kolomet.service.SellerService;
import cz.kolomet.service.SellerStatusService;

@Configurable
/**
 * A central place to register application converters and formatters. 
 */
public class ApplicationConversionServiceFactoryBean extends FormattingConversionServiceFactoryBean {

	

	@Autowired
    ApplicationPermissionService applicationPermissionService;

	@Autowired
    ApplicationRoleService applicationRoleService;

	@Autowired
    ApplicationUserService applicationUserService;

	@Autowired
    CategoryService categoryService;

	@Autowired
    NewsItemService newsItemService;

	@Autowired
    NewsItemPhotoUrlService newsItemPhotoUrlService;

	@Autowired
    PhotoUrlService photoUrlService;

	@Autowired
    PlaceService placeService;

	@Autowired
    PlaceCommentService placeCommentService;

	@Autowired
    PlacePhotoUrlService placePhotoUrlService;

	@Autowired
    ProducerService producerService;

	@Autowired
    ProductService productService;

	@Autowired
    ProductAttributeService productAttributeService;

	@Autowired
    RateService rateService;

	@Autowired
    RegistrationRequestService registrationRequestService;

	@Autowired
    SellerService sellerService;

	@Autowired
    SellerPhotoUrlService sellerPhotoUrlService;

	@Autowired
    BicycleCategoryService bicycleCategoryService;

	@Autowired
    CategoryTypeService categoryTypeService;

	@Autowired
    CountryStateService countryStateService;

	@Autowired
    FigureHeightService figureHeightService;

	@Autowired
    PlaceTypeService placeTypeService;

	@Autowired
    ProductAttributeTypeService productAttributeTypeService;

	@Autowired
    ProductColorService productColorService;

	@Autowired
    ProductUsageService productUsageService;
	
	@Autowired
	private SellerStatusService sellerStatusService;
	
	@Autowired
	private RegionService regionService;
	
	public void installLabelConverters(FormatterRegistry registry) {
		registry.addFormatter(getCountryStateFormatter());
		registry.addFormatter(getGpsLocationFormatter());
		registry.addFormatter(getAddressFormatter());
		registry.addConverter(getSellerStatusToStringConverter());
		registry.addConverter(getFileInfoToStringConverter());
		registry.addConverter(getStringToFileInfoConverter());
        registry.addConverter(getApplicationPermissionToStringConverter());
        registry.addConverter(getIdToApplicationPermissionConverter());
        registry.addConverter(getStringToApplicationPermissionConverter());
        registry.addConverter(getApplicationRoleToStringConverter());
        registry.addConverter(getIdToApplicationRoleConverter());
        registry.addConverter(getStringToApplicationRoleConverter());
        registry.addConverter(getApplicationUserToStringConverter());
        registry.addConverter(getIdToApplicationUserConverter());
        registry.addConverter(getStringToApplicationUserConverter());
        registry.addConverter(getCategoryToStringConverter());
        registry.addConverter(getIdToCategoryConverter());
        registry.addConverter(getStringToCategoryConverter());
        registry.addConverter(getNewsItemToStringConverter());
        registry.addConverter(getIdToNewsItemConverter());
        registry.addConverter(getStringToNewsItemConverter());
        registry.addConverter(getNewsItemPhotoUrlToStringConverter());
        registry.addConverter(getIdToNewsItemPhotoUrlConverter());
        registry.addConverter(getStringToNewsItemPhotoUrlConverter());
        registry.addConverter(getPhotoUrlToStringConverter());
        registry.addConverter(getIdToPhotoUrlConverter());
        registry.addConverter(getStringToPhotoUrlConverter());
        registry.addConverter(getPlaceToStringConverter());
        registry.addConverter(getIdToPlaceConverter());
        registry.addConverter(getStringToPlaceConverter());
        registry.addConverter(getPlaceCommentToStringConverter());
        registry.addConverter(getIdToPlaceCommentConverter());
        registry.addConverter(getStringToPlaceCommentConverter());
        registry.addConverter(getPlacePhotoUrlToStringConverter());
        registry.addConverter(getIdToPlacePhotoUrlConverter());
        registry.addConverter(getStringToPlacePhotoUrlConverter());
        registry.addConverter(getProducerToStringConverter());
        registry.addConverter(getIdToProducerConverter());
        registry.addConverter(getStringToProducerConverter());
        registry.addConverter(getProductToStringConverter());
        registry.addConverter(getIdToProductConverter());
        registry.addConverter(getStringToProductConverter());
        registry.addConverter(getProductAttributeToStringConverter());
        registry.addConverter(getIdToProductAttributeConverter());
        registry.addConverter(getStringToProductAttributeConverter());
        registry.addConverter(getRateToStringConverter());
        registry.addConverter(getIdToRateConverter());
        registry.addConverter(getStringToRateConverter());
        registry.addConverter(getRegistrationRequestToStringConverter());
        registry.addConverter(getIdToRegistrationRequestConverter());
        registry.addConverter(getStringToRegistrationRequestConverter());
        registry.addConverter(getSellerToStringConverter());
        registry.addConverter(getIdToSellerConverter());
        registry.addConverter(getStringToSellerConverter());
        registry.addConverter(getSellerPhotoUrlToStringConverter());
        registry.addConverter(getIdToSellerPhotoUrlConverter());
        registry.addConverter(getStringToSellerPhotoUrlConverter());
        registry.addConverter(getBicycleCategoryToStringConverter());
        registry.addConverter(getIdToBicycleCategoryConverter());
        registry.addConverter(getStringToBicycleCategoryConverter());
        registry.addConverter(getCategoryTypeToStringConverter());
        registry.addConverter(getIdToCategoryTypeConverter());
        registry.addConverter(getStringToCategoryTypeConverter());
        registry.addConverter(getCountryStateToStringConverter());
        registry.addConverter(getIdToCountryStateConverter());
        registry.addConverter(getStringToCountryStateConverter());
        registry.addConverter(getFigureHeightToStringConverter());
        registry.addConverter(getIdToFigureHeightConverter());
        registry.addConverter(getStringToFigureHeightConverter());
        registry.addConverter(getPlaceTypeToStringConverter());
        registry.addConverter(getIdToPlaceTypeConverter());
        registry.addConverter(getStringToPlaceTypeConverter());
        registry.addConverter(getProductAttributeTypeToStringConverter());
        registry.addConverter(getIdToProductAttributeTypeConverter());
        registry.addConverter(getStringToProductAttributeTypeConverter());
        registry.addConverter(getProductColorToStringConverter());
        registry.addConverter(getIdToProductColorConverter());
        registry.addConverter(getStringToProductColorConverter());
        registry.addConverter(getProductUsageToStringConverter());
        registry.addConverter(getIdToProductUsageConverter());
        registry.addConverter(getStringToProductUsageConverter());
        registry.addConverter(getRegionToStringConverter());
        registry.addConverter(getIdToRegionConverter());
        registry.addConverter(getStringToRegionConverter());
        registry.addConverter(getSellerStatusToStringConverter());
        registry.addConverter(getIdToSellerStatusConverter());
        registry.addConverter(getStringToSellerStatusConverter());
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
    
    public Converter<String, FileInfo> getStringToFileInfoConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.dto.FileInfo>() {
            public cz.kolomet.dto.FileInfo convert(String value) {
            	
            	String[] values = value.split("__;__");
            	if (values.length > 2) {
            		try {
            			Long id = Long.parseLong(values[2]);
            			return new FileInfo(id, values[0], values[1]);
            		} catch (NumberFormatException e) {
            			return new FileInfo(values[0], values[1]);
            		}
            	}
            	if (values.length > 1) {
            		return new FileInfo(values[0], values[1]);
            	}
            	if (values.length > 0) {
            		return new FileInfo(values[0]);
            	}
            	return null;
            }
        };
    }
	
	public Converter<FileInfo, String> getFileInfoToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<cz.kolomet.dto.FileInfo, java.lang.String>() {
            public String convert(FileInfo fileInfo) {
            	StringBuilder builder = new StringBuilder()
            		.append(fileInfo.getFileName())
            		.append("__;__")
            		.append(fileInfo.getContentType());
            	if (fileInfo.getId() != null) {
            		builder
            		.append("__;__")
            		.append(fileInfo.getId());
            	}
                return builder.toString();
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
		    			builder.append(object.getHouseNr());
		    		}
		    		builder.append(", ");
		    	}
		    	if (StringUtils.isNotEmpty(object.getCity())) {
		    		builder.append(object.getCity());
		    		builder.append(", ");
		    	}
		    	if (StringUtils.isNotEmpty(object.getPostCode())) {
		    		builder.append(object.getPostCode());
		    	}
		    	return builder.toString();
			}

			@Override
			public Address parse(String text, Locale locale) throws ParseException {
				throw new UnsupportedOperationException();
			}
		};
	}

	public Converter<Long, ApplicationPermission> getIdToApplicationPermissionConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.ApplicationPermission>() {
            public cz.kolomet.domain.ApplicationPermission convert(java.lang.Long id) {
                return applicationPermissionService.findApplicationPermission(id);
            }
        };
    }

	public Converter<String, ApplicationPermission> getStringToApplicationPermissionConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.ApplicationPermission>() {
            public cz.kolomet.domain.ApplicationPermission convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), ApplicationPermission.class);
            }
        };
    }

	public Converter<Long, ApplicationRole> getIdToApplicationRoleConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.ApplicationRole>() {
            public cz.kolomet.domain.ApplicationRole convert(java.lang.Long id) {
                return applicationRoleService.findApplicationRole(id);
            }
        };
    }

	public Converter<String, ApplicationRole> getStringToApplicationRoleConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.ApplicationRole>() {
            public cz.kolomet.domain.ApplicationRole convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), ApplicationRole.class);
            }
        };
    }

	public Converter<Long, ApplicationUser> getIdToApplicationUserConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.ApplicationUser>() {
            public cz.kolomet.domain.ApplicationUser convert(java.lang.Long id) {
                return applicationUserService.findApplicationUser(id);
            }
        };
    }

	public Converter<String, ApplicationUser> getStringToApplicationUserConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.ApplicationUser>() {
            public cz.kolomet.domain.ApplicationUser convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), ApplicationUser.class);
            }
        };
    }

	public Converter<Long, Category> getIdToCategoryConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.Category>() {
            public cz.kolomet.domain.Category convert(java.lang.Long id) {
                return categoryService.findCategory(id);
            }
        };
    }

	public Converter<String, Category> getStringToCategoryConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.Category>() {
            public cz.kolomet.domain.Category convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Category.class);
            }
        };
    }

	public Converter<NewsItem, String> getNewsItemToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<cz.kolomet.domain.NewsItem, java.lang.String>() {
            public String convert(NewsItem newsItem) {
                return new StringBuilder().append(newsItem.getCreated()).append(' ').append(newsItem.getLastModified()).append(' ').append(newsItem.getNewsItemDate()).append(' ').append(newsItem.getText()).toString();
            }
        };
    }

	public Converter<Long, NewsItem> getIdToNewsItemConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.NewsItem>() {
            public cz.kolomet.domain.NewsItem convert(java.lang.Long id) {
                return newsItemService.findNewsItem(id);
            }
        };
    }

	public Converter<String, NewsItem> getStringToNewsItemConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.NewsItem>() {
            public cz.kolomet.domain.NewsItem convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), NewsItem.class);
            }
        };
    }

	public Converter<NewsItemPhotoUrl, String> getNewsItemPhotoUrlToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<cz.kolomet.domain.NewsItemPhotoUrl, java.lang.String>() {
            public String convert(NewsItemPhotoUrl newsItemPhotoUrl) {
                return new StringBuilder().append(newsItemPhotoUrl.getCreated()).append(' ').append(newsItemPhotoUrl.getLastModified()).append(' ').append(newsItemPhotoUrl.getFileName()).append(' ').append(newsItemPhotoUrl.getContentType()).toString();
            }
        };
    }

	public Converter<Long, NewsItemPhotoUrl> getIdToNewsItemPhotoUrlConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.NewsItemPhotoUrl>() {
            public cz.kolomet.domain.NewsItemPhotoUrl convert(java.lang.Long id) {
                return newsItemPhotoUrlService.findNewsItemPhotoUrl(id);
            }
        };
    }

	public Converter<String, NewsItemPhotoUrl> getStringToNewsItemPhotoUrlConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.NewsItemPhotoUrl>() {
            public cz.kolomet.domain.NewsItemPhotoUrl convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), NewsItemPhotoUrl.class);
            }
        };
    }

	public Converter<PhotoUrl, String> getPhotoUrlToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<cz.kolomet.domain.PhotoUrl, java.lang.String>() {
            public String convert(PhotoUrl photoUrl) {
                return new StringBuilder().append(photoUrl.getCreated()).append(' ').append(photoUrl.getLastModified()).append(' ').append(photoUrl.getFileName()).append(' ').append(photoUrl.getContentType()).toString();
            }
        };
    }

	public Converter<Long, PhotoUrl> getIdToPhotoUrlConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.PhotoUrl>() {
            public cz.kolomet.domain.PhotoUrl convert(java.lang.Long id) {
                return photoUrlService.findPhotoUrl(id);
            }
        };
    }

	public Converter<String, PhotoUrl> getStringToPhotoUrlConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.PhotoUrl>() {
            public cz.kolomet.domain.PhotoUrl convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), PhotoUrl.class);
            }
        };
    }

	public Converter<Place, String> getPlaceToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<cz.kolomet.domain.Place, java.lang.String>() {
            public String convert(Place place) {
                return new StringBuilder().append(place.getCreated()).append(' ').append(place.getLastModified()).append(' ').append(place.getName()).append(' ').append(place.getDescription()).toString();
            }
        };
    }

	public Converter<Long, Place> getIdToPlaceConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.Place>() {
            public cz.kolomet.domain.Place convert(java.lang.Long id) {
                return placeService.findPlace(id);
            }
        };
    }

	public Converter<String, Place> getStringToPlaceConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.Place>() {
            public cz.kolomet.domain.Place convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Place.class);
            }
        };
    }

	public Converter<PlaceComment, String> getPlaceCommentToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<cz.kolomet.domain.PlaceComment, java.lang.String>() {
            public String convert(PlaceComment placeComment) {
                return new StringBuilder().append(placeComment.getCreated()).append(' ').append(placeComment.getLastModified()).append(' ').append(placeComment.getText()).toString();
            }
        };
    }

	public Converter<Long, PlaceComment> getIdToPlaceCommentConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.PlaceComment>() {
            public cz.kolomet.domain.PlaceComment convert(java.lang.Long id) {
                return placeCommentService.findPlaceComment(id);
            }
        };
    }

	public Converter<String, PlaceComment> getStringToPlaceCommentConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.PlaceComment>() {
            public cz.kolomet.domain.PlaceComment convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), PlaceComment.class);
            }
        };
    }

	public Converter<PlacePhotoUrl, String> getPlacePhotoUrlToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<cz.kolomet.domain.PlacePhotoUrl, java.lang.String>() {
            public String convert(PlacePhotoUrl placePhotoUrl) {
                return new StringBuilder().append(placePhotoUrl.getCreated()).append(' ').append(placePhotoUrl.getLastModified()).append(' ').append(placePhotoUrl.getFileName()).append(' ').append(placePhotoUrl.getContentType()).toString();
            }
        };
    }

	public Converter<Long, PlacePhotoUrl> getIdToPlacePhotoUrlConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.PlacePhotoUrl>() {
            public cz.kolomet.domain.PlacePhotoUrl convert(java.lang.Long id) {
                return placePhotoUrlService.findPlacePhotoUrl(id);
            }
        };
    }

	public Converter<String, PlacePhotoUrl> getStringToPlacePhotoUrlConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.PlacePhotoUrl>() {
            public cz.kolomet.domain.PlacePhotoUrl convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), PlacePhotoUrl.class);
            }
        };
    }

	public Converter<Long, Producer> getIdToProducerConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.Producer>() {
            public cz.kolomet.domain.Producer convert(java.lang.Long id) {
                return producerService.findProducer(id);
            }
        };
    }

	public Converter<String, Producer> getStringToProducerConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.Producer>() {
            public cz.kolomet.domain.Producer convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Producer.class);
            }
        };
    }

	public Converter<Long, Product> getIdToProductConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.Product>() {
            public cz.kolomet.domain.Product convert(java.lang.Long id) {
                return productService.findProduct(id);
            }
        };
    }

	public Converter<String, Product> getStringToProductConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.Product>() {
            public cz.kolomet.domain.Product convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Product.class);
            }
        };
    }

	public Converter<ProductAttribute, String> getProductAttributeToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<cz.kolomet.domain.ProductAttribute, java.lang.String>() {
            public String convert(ProductAttribute productAttribute) {
                return new StringBuilder().append(productAttribute.getCreated()).append(' ').append(productAttribute.getLastModified()).append(' ').append(productAttribute.getAttributeValue()).toString();
            }
        };
    }

	public Converter<Long, ProductAttribute> getIdToProductAttributeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.ProductAttribute>() {
            public cz.kolomet.domain.ProductAttribute convert(java.lang.Long id) {
                return productAttributeService.findProductAttribute(id);
            }
        };
    }

	public Converter<String, ProductAttribute> getStringToProductAttributeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.ProductAttribute>() {
            public cz.kolomet.domain.ProductAttribute convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), ProductAttribute.class);
            }
        };
    }

	public Converter<Rate, String> getRateToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<cz.kolomet.domain.Rate, java.lang.String>() {
            public String convert(Rate rate) {
                return new StringBuilder().append(rate.getCreated()).append(' ').append(rate.getLastModified()).append(' ').append(rate.getEntityId()).append(' ').append(rate.getIpAddress()).toString();
            }
        };
    }

	public Converter<Long, Rate> getIdToRateConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.Rate>() {
            public cz.kolomet.domain.Rate convert(java.lang.Long id) {
                return rateService.findRate(id);
            }
        };
    }

	public Converter<String, Rate> getStringToRateConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.Rate>() {
            public cz.kolomet.domain.Rate convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Rate.class);
            }
        };
    }

	public Converter<RegistrationRequest, String> getRegistrationRequestToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<cz.kolomet.domain.RegistrationRequest, java.lang.String>() {
            public String convert(RegistrationRequest registrationRequest) {
                return new StringBuilder().append(registrationRequest.getCreated()).append(' ').append(registrationRequest.getLastModified()).append(' ').append(registrationRequest.getEmail()).append(' ').append(registrationRequest.getPhone()).toString();
            }
        };
    }

	public Converter<Long, RegistrationRequest> getIdToRegistrationRequestConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.RegistrationRequest>() {
            public cz.kolomet.domain.RegistrationRequest convert(java.lang.Long id) {
                return registrationRequestService.findRegistrationRequest(id);
            }
        };
    }

	public Converter<String, RegistrationRequest> getStringToRegistrationRequestConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.RegistrationRequest>() {
            public cz.kolomet.domain.RegistrationRequest convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), RegistrationRequest.class);
            }
        };
    }

	public Converter<Long, Seller> getIdToSellerConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.Seller>() {
            public cz.kolomet.domain.Seller convert(java.lang.Long id) {
                return sellerService.findSeller(id);
            }
        };
    }

	public Converter<String, Seller> getStringToSellerConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.Seller>() {
            public cz.kolomet.domain.Seller convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Seller.class);
            }
        };
    }

	public Converter<SellerPhotoUrl, String> getSellerPhotoUrlToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<cz.kolomet.domain.SellerPhotoUrl, java.lang.String>() {
            public String convert(SellerPhotoUrl sellerPhotoUrl) {
                return new StringBuilder().append(sellerPhotoUrl.getCreated()).append(' ').append(sellerPhotoUrl.getLastModified()).append(' ').append(sellerPhotoUrl.getFileName()).append(' ').append(sellerPhotoUrl.getContentType()).toString();
            }
        };
    }

	public Converter<Long, SellerPhotoUrl> getIdToSellerPhotoUrlConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.SellerPhotoUrl>() {
            public cz.kolomet.domain.SellerPhotoUrl convert(java.lang.Long id) {
                return sellerPhotoUrlService.findSellerPhotoUrl(id);
            }
        };
    }

	public Converter<String, SellerPhotoUrl> getStringToSellerPhotoUrlConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.SellerPhotoUrl>() {
            public cz.kolomet.domain.SellerPhotoUrl convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), SellerPhotoUrl.class);
            }
        };
    }

	public Converter<BicycleCategory, String> getBicycleCategoryToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<cz.kolomet.domain.codelist.BicycleCategory, java.lang.String>() {
            public String convert(BicycleCategory bicycleCategory) {
                return new StringBuilder().append(bicycleCategory.getCreated()).append(' ').append(bicycleCategory.getLastModified()).append(' ').append(bicycleCategory.getCodeKey()).append(' ').append(bicycleCategory.getCodeDescription()).toString();
            }
        };
    }

	public Converter<Long, BicycleCategory> getIdToBicycleCategoryConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.codelist.BicycleCategory>() {
            public cz.kolomet.domain.codelist.BicycleCategory convert(java.lang.Long id) {
                return bicycleCategoryService.findBicycleCategory(id);
            }
        };
    }

	public Converter<String, BicycleCategory> getStringToBicycleCategoryConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.codelist.BicycleCategory>() {
            public cz.kolomet.domain.codelist.BicycleCategory convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), BicycleCategory.class);
            }
        };
    }

	public Converter<Long, CategoryType> getIdToCategoryTypeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.codelist.CategoryType>() {
            public cz.kolomet.domain.codelist.CategoryType convert(java.lang.Long id) {
                return categoryTypeService.findCategoryType(id);
            }
        };
    }

	public Converter<String, CategoryType> getStringToCategoryTypeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.codelist.CategoryType>() {
            public cz.kolomet.domain.codelist.CategoryType convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), CategoryType.class);
            }
        };
    }

	public Converter<Long, CountryState> getIdToCountryStateConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.codelist.CountryState>() {
            public cz.kolomet.domain.codelist.CountryState convert(java.lang.Long id) {
                return countryStateService.findCountryState(id);
            }
        };
    }

	public Converter<String, CountryState> getStringToCountryStateConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.codelist.CountryState>() {
            public cz.kolomet.domain.codelist.CountryState convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), CountryState.class);
            }
        };
    }

	public Converter<FigureHeight, String> getFigureHeightToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<cz.kolomet.domain.codelist.FigureHeight, java.lang.String>() {
            public String convert(FigureHeight figureHeight) {
                return new StringBuilder().append(figureHeight.getCreated()).append(' ').append(figureHeight.getLastModified()).append(' ').append(figureHeight.getCodeKey()).append(' ').append(figureHeight.getCodeDescription()).toString();
            }
        };
    }

	public Converter<Long, FigureHeight> getIdToFigureHeightConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.codelist.FigureHeight>() {
            public cz.kolomet.domain.codelist.FigureHeight convert(java.lang.Long id) {
                return figureHeightService.findFigureHeight(id);
            }
        };
    }

	public Converter<String, FigureHeight> getStringToFigureHeightConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.codelist.FigureHeight>() {
            public cz.kolomet.domain.codelist.FigureHeight convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), FigureHeight.class);
            }
        };
    }

	public Converter<Long, PlaceType> getIdToPlaceTypeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.codelist.PlaceType>() {
            public cz.kolomet.domain.codelist.PlaceType convert(java.lang.Long id) {
                return placeTypeService.findPlaceType(id);
            }
        };
    }

	public Converter<String, PlaceType> getStringToPlaceTypeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.codelist.PlaceType>() {
            public cz.kolomet.domain.codelist.PlaceType convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), PlaceType.class);
            }
        };
    }

	public Converter<Long, ProductAttributeType> getIdToProductAttributeTypeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.codelist.ProductAttributeType>() {
            public cz.kolomet.domain.codelist.ProductAttributeType convert(java.lang.Long id) {
                return productAttributeTypeService.findProductAttributeType(id);
            }
        };
    }

	public Converter<String, ProductAttributeType> getStringToProductAttributeTypeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.codelist.ProductAttributeType>() {
            public cz.kolomet.domain.codelist.ProductAttributeType convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), ProductAttributeType.class);
            }
        };
    }

	public Converter<ProductColor, String> getProductColorToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<cz.kolomet.domain.codelist.ProductColor, java.lang.String>() {
            public String convert(ProductColor productColor) {
                return new StringBuilder().append(productColor.getCreated()).append(' ').append(productColor.getLastModified()).append(' ').append(productColor.getCodeKey()).append(' ').append(productColor.getCodeDescription()).toString();
            }
        };
    }

	public Converter<Long, ProductColor> getIdToProductColorConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.codelist.ProductColor>() {
            public cz.kolomet.domain.codelist.ProductColor convert(java.lang.Long id) {
                return productColorService.findProductColor(id);
            }
        };
    }

	public Converter<String, ProductColor> getStringToProductColorConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.codelist.ProductColor>() {
            public cz.kolomet.domain.codelist.ProductColor convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), ProductColor.class);
            }
        };
    }

	public Converter<ProductUsage, String> getProductUsageToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<cz.kolomet.domain.codelist.ProductUsage, java.lang.String>() {
            public String convert(ProductUsage productUsage) {
                return new StringBuilder().append(productUsage.getCreated()).append(' ').append(productUsage.getLastModified()).append(' ').append(productUsage.getCodeKey()).append(' ').append(productUsage.getCodeDescription()).toString();
            }
        };
    }

	public Converter<Long, ProductUsage> getIdToProductUsageConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.codelist.ProductUsage>() {
            public cz.kolomet.domain.codelist.ProductUsage convert(java.lang.Long id) {
                return productUsageService.findProductUsage(id);
            }
        };
    }

	public Converter<String, ProductUsage> getStringToProductUsageConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.codelist.ProductUsage>() {
            public cz.kolomet.domain.codelist.ProductUsage convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), ProductUsage.class);
            }
        };
    }

	public Converter<Long, Region> getIdToRegionConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.codelist.Region>() {
            public cz.kolomet.domain.codelist.Region convert(java.lang.Long id) {
                return regionService.findRegion(id);
            }
        };
    }

	public Converter<Long, SellerStatus> getIdToSellerStatusConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.codelist.SellerStatus>() {
            public cz.kolomet.domain.codelist.SellerStatus convert(java.lang.Long id) {
                return sellerStatusService.findSellerStatus(id);
            }
        };
    }

	public Converter<String, SellerStatus> getStringToSellerStatusConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.codelist.SellerStatus>() {
            public cz.kolomet.domain.codelist.SellerStatus convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), SellerStatus.class);
            }
        };
    }

	public void afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
	
}