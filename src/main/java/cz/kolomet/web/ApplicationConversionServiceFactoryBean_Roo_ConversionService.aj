// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.web;

import cz.kolomet.domain.ApplicationPermission;
import cz.kolomet.domain.ApplicationRole;
import cz.kolomet.domain.ApplicationUser;
import cz.kolomet.domain.Category;
import cz.kolomet.domain.NewsItem;
import cz.kolomet.domain.NewsItemPhotoUrl;
import cz.kolomet.domain.PhotoUrl;
import cz.kolomet.domain.Place;
import cz.kolomet.domain.Producer;
import cz.kolomet.domain.Product;
import cz.kolomet.domain.ProductAttribute;
import cz.kolomet.domain.RegistrationRequest;
import cz.kolomet.domain.Seller;
import cz.kolomet.domain.SellerPhotoUrl;
import cz.kolomet.domain.codelist.BicycleCategory;
import cz.kolomet.domain.codelist.CategoryType;
import cz.kolomet.domain.codelist.CountryState;
import cz.kolomet.domain.codelist.FigureHeight;
import cz.kolomet.domain.codelist.ProductAttributeType;
import cz.kolomet.domain.codelist.ProductColor;
import cz.kolomet.domain.codelist.ProductUsage;
import cz.kolomet.domain.codelist.Region;
import cz.kolomet.domain.codelist.SellerStatus;
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
import cz.kolomet.service.PlaceService;
import cz.kolomet.service.ProducerService;
import cz.kolomet.service.ProductAttributeService;
import cz.kolomet.service.ProductAttributeTypeService;
import cz.kolomet.service.ProductColorService;
import cz.kolomet.service.ProductService;
import cz.kolomet.service.ProductUsageService;
import cz.kolomet.service.RegionService;
import cz.kolomet.service.RegistrationRequestService;
import cz.kolomet.service.SellerPhotoUrlService;
import cz.kolomet.service.SellerService;
import cz.kolomet.web.ApplicationConversionServiceFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    @Autowired
    ApplicationPermissionService ApplicationConversionServiceFactoryBean.applicationPermissionService;
    
    @Autowired
    ApplicationRoleService ApplicationConversionServiceFactoryBean.applicationRoleService;
    
    @Autowired
    ApplicationUserService ApplicationConversionServiceFactoryBean.applicationUserService;
    
    @Autowired
    CategoryService ApplicationConversionServiceFactoryBean.categoryService;
    
    @Autowired
    NewsItemService ApplicationConversionServiceFactoryBean.newsItemService;
    
    @Autowired
    NewsItemPhotoUrlService ApplicationConversionServiceFactoryBean.newsItemPhotoUrlService;
    
    @Autowired
    PhotoUrlService ApplicationConversionServiceFactoryBean.photoUrlService;
    
    @Autowired
    PlaceService ApplicationConversionServiceFactoryBean.placeService;
    
    @Autowired
    ProducerService ApplicationConversionServiceFactoryBean.producerService;
    
    @Autowired
    ProductService ApplicationConversionServiceFactoryBean.productService;
    
    @Autowired
    ProductAttributeService ApplicationConversionServiceFactoryBean.productAttributeService;
    
    @Autowired
    RegistrationRequestService ApplicationConversionServiceFactoryBean.registrationRequestService;
    
    @Autowired
    SellerService ApplicationConversionServiceFactoryBean.sellerService;
    
    @Autowired
    SellerPhotoUrlService ApplicationConversionServiceFactoryBean.sellerPhotoUrlService;
    
    @Autowired
    BicycleCategoryService ApplicationConversionServiceFactoryBean.bicycleCategoryService;
    
    @Autowired
    CategoryTypeService ApplicationConversionServiceFactoryBean.categoryTypeService;
    
    @Autowired
    CountryStateService ApplicationConversionServiceFactoryBean.countryStateService;
    
    @Autowired
    FigureHeightService ApplicationConversionServiceFactoryBean.figureHeightService;
    
    @Autowired
    ProductAttributeTypeService ApplicationConversionServiceFactoryBean.productAttributeTypeService;
    
    @Autowired
    ProductColorService ApplicationConversionServiceFactoryBean.productColorService;
    
    @Autowired
    ProductUsageService ApplicationConversionServiceFactoryBean.productUsageService;
    
    @Autowired
    RegionService ApplicationConversionServiceFactoryBean.regionService;
    
    public Converter<Long, ApplicationPermission> ApplicationConversionServiceFactoryBean.getIdToApplicationPermissionConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.ApplicationPermission>() {
            public cz.kolomet.domain.ApplicationPermission convert(java.lang.Long id) {
                return applicationPermissionService.findApplicationPermission(id);
            }
        };
    }
    
    public Converter<String, ApplicationPermission> ApplicationConversionServiceFactoryBean.getStringToApplicationPermissionConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.ApplicationPermission>() {
            public cz.kolomet.domain.ApplicationPermission convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), ApplicationPermission.class);
            }
        };
    }
    
    public Converter<Long, ApplicationRole> ApplicationConversionServiceFactoryBean.getIdToApplicationRoleConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.ApplicationRole>() {
            public cz.kolomet.domain.ApplicationRole convert(java.lang.Long id) {
                return applicationRoleService.findApplicationRole(id);
            }
        };
    }
    
    public Converter<String, ApplicationRole> ApplicationConversionServiceFactoryBean.getStringToApplicationRoleConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.ApplicationRole>() {
            public cz.kolomet.domain.ApplicationRole convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), ApplicationRole.class);
            }
        };
    }
    
    public Converter<Long, ApplicationUser> ApplicationConversionServiceFactoryBean.getIdToApplicationUserConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.ApplicationUser>() {
            public cz.kolomet.domain.ApplicationUser convert(java.lang.Long id) {
                return applicationUserService.findApplicationUser(id);
            }
        };
    }
    
    public Converter<String, ApplicationUser> ApplicationConversionServiceFactoryBean.getStringToApplicationUserConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.ApplicationUser>() {
            public cz.kolomet.domain.ApplicationUser convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), ApplicationUser.class);
            }
        };
    }
    
    public Converter<Long, Category> ApplicationConversionServiceFactoryBean.getIdToCategoryConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.Category>() {
            public cz.kolomet.domain.Category convert(java.lang.Long id) {
                return categoryService.findCategory(id);
            }
        };
    }
    
    public Converter<String, Category> ApplicationConversionServiceFactoryBean.getStringToCategoryConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.Category>() {
            public cz.kolomet.domain.Category convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Category.class);
            }
        };
    }
    
    public Converter<NewsItem, String> ApplicationConversionServiceFactoryBean.getNewsItemToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<cz.kolomet.domain.NewsItem, java.lang.String>() {
            public String convert(NewsItem newsItem) {
                return new StringBuilder().append(newsItem.getCreated()).append(' ').append(newsItem.getLastModified()).append(' ').append(newsItem.getNewsItemDate()).append(' ').append(newsItem.getText()).toString();
            }
        };
    }
    
    public Converter<Long, NewsItem> ApplicationConversionServiceFactoryBean.getIdToNewsItemConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.NewsItem>() {
            public cz.kolomet.domain.NewsItem convert(java.lang.Long id) {
                return newsItemService.findNewsItem(id);
            }
        };
    }
    
    public Converter<String, NewsItem> ApplicationConversionServiceFactoryBean.getStringToNewsItemConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.NewsItem>() {
            public cz.kolomet.domain.NewsItem convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), NewsItem.class);
            }
        };
    }
    
    public Converter<NewsItemPhotoUrl, String> ApplicationConversionServiceFactoryBean.getNewsItemPhotoUrlToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<cz.kolomet.domain.NewsItemPhotoUrl, java.lang.String>() {
            public String convert(NewsItemPhotoUrl newsItemPhotoUrl) {
                return new StringBuilder().append(newsItemPhotoUrl.getCreated()).append(' ').append(newsItemPhotoUrl.getLastModified()).append(' ').append(newsItemPhotoUrl.getFileName()).append(' ').append(newsItemPhotoUrl.getContentType()).toString();
            }
        };
    }
    
    public Converter<Long, NewsItemPhotoUrl> ApplicationConversionServiceFactoryBean.getIdToNewsItemPhotoUrlConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.NewsItemPhotoUrl>() {
            public cz.kolomet.domain.NewsItemPhotoUrl convert(java.lang.Long id) {
                return newsItemPhotoUrlService.findNewsItemPhotoUrl(id);
            }
        };
    }
    
    public Converter<String, NewsItemPhotoUrl> ApplicationConversionServiceFactoryBean.getStringToNewsItemPhotoUrlConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.NewsItemPhotoUrl>() {
            public cz.kolomet.domain.NewsItemPhotoUrl convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), NewsItemPhotoUrl.class);
            }
        };
    }
    
    public Converter<PhotoUrl, String> ApplicationConversionServiceFactoryBean.getPhotoUrlToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<cz.kolomet.domain.PhotoUrl, java.lang.String>() {
            public String convert(PhotoUrl photoUrl) {
                return new StringBuilder().append(photoUrl.getCreated()).append(' ').append(photoUrl.getLastModified()).append(' ').append(photoUrl.getFileName()).append(' ').append(photoUrl.getContentType()).toString();
            }
        };
    }
    
    public Converter<Long, PhotoUrl> ApplicationConversionServiceFactoryBean.getIdToPhotoUrlConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.PhotoUrl>() {
            public cz.kolomet.domain.PhotoUrl convert(java.lang.Long id) {
                return photoUrlService.findPhotoUrl(id);
            }
        };
    }
    
    public Converter<String, PhotoUrl> ApplicationConversionServiceFactoryBean.getStringToPhotoUrlConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.PhotoUrl>() {
            public cz.kolomet.domain.PhotoUrl convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), PhotoUrl.class);
            }
        };
    }
    
    public Converter<Place, String> ApplicationConversionServiceFactoryBean.getPlaceToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<cz.kolomet.domain.Place, java.lang.String>() {
            public String convert(Place place) {
                return new StringBuilder().append(place.getCreated()).append(' ').append(place.getLastModified()).toString();
            }
        };
    }
    
    public Converter<Long, Place> ApplicationConversionServiceFactoryBean.getIdToPlaceConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.Place>() {
            public cz.kolomet.domain.Place convert(java.lang.Long id) {
                return placeService.findPlace(id);
            }
        };
    }
    
    public Converter<String, Place> ApplicationConversionServiceFactoryBean.getStringToPlaceConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.Place>() {
            public cz.kolomet.domain.Place convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Place.class);
            }
        };
    }
    
    public Converter<Long, Producer> ApplicationConversionServiceFactoryBean.getIdToProducerConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.Producer>() {
            public cz.kolomet.domain.Producer convert(java.lang.Long id) {
                return producerService.findProducer(id);
            }
        };
    }
    
    public Converter<String, Producer> ApplicationConversionServiceFactoryBean.getStringToProducerConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.Producer>() {
            public cz.kolomet.domain.Producer convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Producer.class);
            }
        };
    }
    
    public Converter<Long, Product> ApplicationConversionServiceFactoryBean.getIdToProductConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.Product>() {
            public cz.kolomet.domain.Product convert(java.lang.Long id) {
                return productService.findProduct(id);
            }
        };
    }
    
    public Converter<String, Product> ApplicationConversionServiceFactoryBean.getStringToProductConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.Product>() {
            public cz.kolomet.domain.Product convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Product.class);
            }
        };
    }
    
    public Converter<ProductAttribute, String> ApplicationConversionServiceFactoryBean.getProductAttributeToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<cz.kolomet.domain.ProductAttribute, java.lang.String>() {
            public String convert(ProductAttribute productAttribute) {
                return new StringBuilder().append(productAttribute.getCreated()).append(' ').append(productAttribute.getLastModified()).append(' ').append(productAttribute.getAttributeValue()).toString();
            }
        };
    }
    
    public Converter<Long, ProductAttribute> ApplicationConversionServiceFactoryBean.getIdToProductAttributeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.ProductAttribute>() {
            public cz.kolomet.domain.ProductAttribute convert(java.lang.Long id) {
                return productAttributeService.findProductAttribute(id);
            }
        };
    }
    
    public Converter<String, ProductAttribute> ApplicationConversionServiceFactoryBean.getStringToProductAttributeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.ProductAttribute>() {
            public cz.kolomet.domain.ProductAttribute convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), ProductAttribute.class);
            }
        };
    }
    
    public Converter<RegistrationRequest, String> ApplicationConversionServiceFactoryBean.getRegistrationRequestToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<cz.kolomet.domain.RegistrationRequest, java.lang.String>() {
            public String convert(RegistrationRequest registrationRequest) {
                return new StringBuilder().append(registrationRequest.getCreated()).append(' ').append(registrationRequest.getLastModified()).append(' ').append(registrationRequest.getEmail()).append(' ').append(registrationRequest.getPhone()).toString();
            }
        };
    }
    
    public Converter<Long, RegistrationRequest> ApplicationConversionServiceFactoryBean.getIdToRegistrationRequestConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.RegistrationRequest>() {
            public cz.kolomet.domain.RegistrationRequest convert(java.lang.Long id) {
                return registrationRequestService.findRegistrationRequest(id);
            }
        };
    }
    
    public Converter<String, RegistrationRequest> ApplicationConversionServiceFactoryBean.getStringToRegistrationRequestConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.RegistrationRequest>() {
            public cz.kolomet.domain.RegistrationRequest convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), RegistrationRequest.class);
            }
        };
    }
    
    public Converter<Long, Seller> ApplicationConversionServiceFactoryBean.getIdToSellerConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.Seller>() {
            public cz.kolomet.domain.Seller convert(java.lang.Long id) {
                return sellerService.findSeller(id);
            }
        };
    }
    
    public Converter<String, Seller> ApplicationConversionServiceFactoryBean.getStringToSellerConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.Seller>() {
            public cz.kolomet.domain.Seller convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Seller.class);
            }
        };
    }
    
    public Converter<SellerPhotoUrl, String> ApplicationConversionServiceFactoryBean.getSellerPhotoUrlToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<cz.kolomet.domain.SellerPhotoUrl, java.lang.String>() {
            public String convert(SellerPhotoUrl sellerPhotoUrl) {
                return new StringBuilder().append(sellerPhotoUrl.getCreated()).append(' ').append(sellerPhotoUrl.getLastModified()).append(' ').append(sellerPhotoUrl.getFileName()).append(' ').append(sellerPhotoUrl.getContentType()).toString();
            }
        };
    }
    
    public Converter<Long, SellerPhotoUrl> ApplicationConversionServiceFactoryBean.getIdToSellerPhotoUrlConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.SellerPhotoUrl>() {
            public cz.kolomet.domain.SellerPhotoUrl convert(java.lang.Long id) {
                return sellerPhotoUrlService.findSellerPhotoUrl(id);
            }
        };
    }
    
    public Converter<String, SellerPhotoUrl> ApplicationConversionServiceFactoryBean.getStringToSellerPhotoUrlConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.SellerPhotoUrl>() {
            public cz.kolomet.domain.SellerPhotoUrl convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), SellerPhotoUrl.class);
            }
        };
    }
    
    public Converter<BicycleCategory, String> ApplicationConversionServiceFactoryBean.getBicycleCategoryToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<cz.kolomet.domain.codelist.BicycleCategory, java.lang.String>() {
            public String convert(BicycleCategory bicycleCategory) {
                return new StringBuilder().append(bicycleCategory.getCreated()).append(' ').append(bicycleCategory.getLastModified()).append(' ').append(bicycleCategory.getCodeKey()).append(' ').append(bicycleCategory.getCodeDescription()).toString();
            }
        };
    }
    
    public Converter<Long, BicycleCategory> ApplicationConversionServiceFactoryBean.getIdToBicycleCategoryConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.codelist.BicycleCategory>() {
            public cz.kolomet.domain.codelist.BicycleCategory convert(java.lang.Long id) {
                return bicycleCategoryService.findBicycleCategory(id);
            }
        };
    }
    
    public Converter<String, BicycleCategory> ApplicationConversionServiceFactoryBean.getStringToBicycleCategoryConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.codelist.BicycleCategory>() {
            public cz.kolomet.domain.codelist.BicycleCategory convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), BicycleCategory.class);
            }
        };
    }
    
    public Converter<Long, CategoryType> ApplicationConversionServiceFactoryBean.getIdToCategoryTypeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.codelist.CategoryType>() {
            public cz.kolomet.domain.codelist.CategoryType convert(java.lang.Long id) {
                return categoryTypeService.findCategoryType(id);
            }
        };
    }
    
    public Converter<String, CategoryType> ApplicationConversionServiceFactoryBean.getStringToCategoryTypeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.codelist.CategoryType>() {
            public cz.kolomet.domain.codelist.CategoryType convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), CategoryType.class);
            }
        };
    }
    
    public Converter<Long, CountryState> ApplicationConversionServiceFactoryBean.getIdToCountryStateConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.codelist.CountryState>() {
            public cz.kolomet.domain.codelist.CountryState convert(java.lang.Long id) {
                return countryStateService.findCountryState(id);
            }
        };
    }
    
    public Converter<String, CountryState> ApplicationConversionServiceFactoryBean.getStringToCountryStateConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.codelist.CountryState>() {
            public cz.kolomet.domain.codelist.CountryState convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), CountryState.class);
            }
        };
    }
    
    public Converter<FigureHeight, String> ApplicationConversionServiceFactoryBean.getFigureHeightToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<cz.kolomet.domain.codelist.FigureHeight, java.lang.String>() {
            public String convert(FigureHeight figureHeight) {
                return new StringBuilder().append(figureHeight.getCreated()).append(' ').append(figureHeight.getLastModified()).append(' ').append(figureHeight.getCodeKey()).append(' ').append(figureHeight.getCodeDescription()).toString();
            }
        };
    }
    
    public Converter<Long, FigureHeight> ApplicationConversionServiceFactoryBean.getIdToFigureHeightConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.codelist.FigureHeight>() {
            public cz.kolomet.domain.codelist.FigureHeight convert(java.lang.Long id) {
                return figureHeightService.findFigureHeight(id);
            }
        };
    }
    
    public Converter<String, FigureHeight> ApplicationConversionServiceFactoryBean.getStringToFigureHeightConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.codelist.FigureHeight>() {
            public cz.kolomet.domain.codelist.FigureHeight convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), FigureHeight.class);
            }
        };
    }
    
    public Converter<Long, ProductAttributeType> ApplicationConversionServiceFactoryBean.getIdToProductAttributeTypeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.codelist.ProductAttributeType>() {
            public cz.kolomet.domain.codelist.ProductAttributeType convert(java.lang.Long id) {
                return productAttributeTypeService.findProductAttributeType(id);
            }
        };
    }
    
    public Converter<String, ProductAttributeType> ApplicationConversionServiceFactoryBean.getStringToProductAttributeTypeConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.codelist.ProductAttributeType>() {
            public cz.kolomet.domain.codelist.ProductAttributeType convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), ProductAttributeType.class);
            }
        };
    }
    
    public Converter<ProductColor, String> ApplicationConversionServiceFactoryBean.getProductColorToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<cz.kolomet.domain.codelist.ProductColor, java.lang.String>() {
            public String convert(ProductColor productColor) {
                return new StringBuilder().append(productColor.getCreated()).append(' ').append(productColor.getLastModified()).append(' ').append(productColor.getCodeKey()).append(' ').append(productColor.getCodeDescription()).toString();
            }
        };
    }
    
    public Converter<Long, ProductColor> ApplicationConversionServiceFactoryBean.getIdToProductColorConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.codelist.ProductColor>() {
            public cz.kolomet.domain.codelist.ProductColor convert(java.lang.Long id) {
                return productColorService.findProductColor(id);
            }
        };
    }
    
    public Converter<String, ProductColor> ApplicationConversionServiceFactoryBean.getStringToProductColorConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.codelist.ProductColor>() {
            public cz.kolomet.domain.codelist.ProductColor convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), ProductColor.class);
            }
        };
    }
    
    public Converter<ProductUsage, String> ApplicationConversionServiceFactoryBean.getProductUsageToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<cz.kolomet.domain.codelist.ProductUsage, java.lang.String>() {
            public String convert(ProductUsage productUsage) {
                return new StringBuilder().append(productUsage.getCreated()).append(' ').append(productUsage.getLastModified()).append(' ').append(productUsage.getCodeKey()).append(' ').append(productUsage.getCodeDescription()).toString();
            }
        };
    }
    
    public Converter<Long, ProductUsage> ApplicationConversionServiceFactoryBean.getIdToProductUsageConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.codelist.ProductUsage>() {
            public cz.kolomet.domain.codelist.ProductUsage convert(java.lang.Long id) {
                return productUsageService.findProductUsage(id);
            }
        };
    }
    
    public Converter<String, ProductUsage> ApplicationConversionServiceFactoryBean.getStringToProductUsageConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.codelist.ProductUsage>() {
            public cz.kolomet.domain.codelist.ProductUsage convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), ProductUsage.class);
            }
        };
    }
    
    public Converter<Long, Region> ApplicationConversionServiceFactoryBean.getIdToRegionConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.codelist.Region>() {
            public cz.kolomet.domain.codelist.Region convert(java.lang.Long id) {
                return regionService.findRegion(id);
            }
        };
    }
    
    public Converter<String, Region> ApplicationConversionServiceFactoryBean.getStringToRegionConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.codelist.Region>() {
            public cz.kolomet.domain.codelist.Region convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Region.class);
            }
        };
    }
    
    public Converter<Long, SellerStatus> ApplicationConversionServiceFactoryBean.getIdToSellerStatusConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.codelist.SellerStatus>() {
            public cz.kolomet.domain.codelist.SellerStatus convert(java.lang.Long id) {
                return sellerStatusService.findSellerStatus(id);
            }
        };
    }
    
    public Converter<String, SellerStatus> ApplicationConversionServiceFactoryBean.getStringToSellerStatusConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.codelist.SellerStatus>() {
            public cz.kolomet.domain.codelist.SellerStatus convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), SellerStatus.class);
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
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
        registry.addConverter(getProducerToStringConverter());
        registry.addConverter(getIdToProducerConverter());
        registry.addConverter(getStringToProducerConverter());
        registry.addConverter(getProductToStringConverter());
        registry.addConverter(getIdToProductConverter());
        registry.addConverter(getStringToProductConverter());
        registry.addConverter(getProductAttributeToStringConverter());
        registry.addConverter(getIdToProductAttributeConverter());
        registry.addConverter(getStringToProductAttributeConverter());
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
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}
