// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.web;

import cz.kolomet.domain.PhotoUrl;
import cz.kolomet.domain.Product;
import cz.kolomet.domain.ProductAttribute;
import cz.kolomet.domain.Seller;
import cz.kolomet.domain.codelist.Category;
import cz.kolomet.domain.codelist.CategoryType;
import cz.kolomet.domain.codelist.CountryState;
import cz.kolomet.domain.codelist.Producer;
import cz.kolomet.domain.codelist.Region;
import cz.kolomet.domain.codelist.SellerStatus;
import cz.kolomet.repository.CountryStateRepository;
import cz.kolomet.repository.RegionRepository;
import cz.kolomet.repository.SellerStatusRepository;
import cz.kolomet.service.CategoryService;
import cz.kolomet.service.CategoryTypeService;
import cz.kolomet.service.CountryStateService;
import cz.kolomet.service.PhotoUrlService;
import cz.kolomet.service.ProductAttributeService;
import cz.kolomet.service.ProductService;
import cz.kolomet.service.SellerService;
import cz.kolomet.web.ApplicationConversionServiceFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    @Autowired
    PhotoUrlService ApplicationConversionServiceFactoryBean.photoUrlService;
    
    @Autowired
    ProductService ApplicationConversionServiceFactoryBean.productService;
    
    @Autowired
    ProductAttributeService ApplicationConversionServiceFactoryBean.productAttributeService;
    
    @Autowired
    SellerService ApplicationConversionServiceFactoryBean.sellerService;
    
    @Autowired
    CategoryService ApplicationConversionServiceFactoryBean.categoryService;
    
    @Autowired
    CategoryTypeService ApplicationConversionServiceFactoryBean.categoryTypeService;
    
    @Autowired
    CountryStateRepository ApplicationConversionServiceFactoryBean.countryStateRepository;
    
    @Autowired
    CountryStateService ApplicationConversionServiceFactoryBean.countryStateService;
    
    @Autowired
    RegionRepository ApplicationConversionServiceFactoryBean.regionRepository;
    
    @Autowired
    SellerStatusRepository ApplicationConversionServiceFactoryBean.sellerStatusRepository;
    
    public Converter<PhotoUrl, String> ApplicationConversionServiceFactoryBean.getPhotoUrlToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<cz.kolomet.domain.PhotoUrl, java.lang.String>() {
            public String convert(PhotoUrl photoUrl) {
                return new StringBuilder().append(photoUrl.getUrlValue()).toString();
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
    
    public Converter<Product, String> ApplicationConversionServiceFactoryBean.getProductToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<cz.kolomet.domain.Product, java.lang.String>() {
            public String convert(Product product) {
                return new StringBuilder().append(product.getProductName()).append(' ').append(product.getPrice()).append(' ').append(product.getDiscount()).toString();
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
                return new StringBuilder().append(productAttribute.getAttributeKey()).append(' ').append(productAttribute.getAttributeValue()).toString();
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
    
    public Converter<Seller, String> ApplicationConversionServiceFactoryBean.getSellerToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<cz.kolomet.domain.Seller, java.lang.String>() {
            public String convert(Seller seller) {
                return new StringBuilder().append(seller.getSellerName()).append(' ').append(seller.getSellerDescription()).append(' ').append(seller.getPersonSalutation()).append(' ').append(seller.getPersonDegree()).toString();
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
    
    public Converter<Category, String> ApplicationConversionServiceFactoryBean.getCategoryToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<cz.kolomet.domain.codelist.Category, java.lang.String>() {
            public String convert(Category category) {
                return new StringBuilder().append(category.getCodeKey()).append(' ').append(category.getCodeDescription()).toString();
            }
        };
    }
    
    public Converter<Long, Category> ApplicationConversionServiceFactoryBean.getIdToCategoryConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.codelist.Category>() {
            public cz.kolomet.domain.codelist.Category convert(java.lang.Long id) {
                return categoryService.findCategory(id);
            }
        };
    }
    
    public Converter<String, Category> ApplicationConversionServiceFactoryBean.getStringToCategoryConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.codelist.Category>() {
            public cz.kolomet.domain.codelist.Category convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Category.class);
            }
        };
    }
    
    public Converter<CategoryType, String> ApplicationConversionServiceFactoryBean.getCategoryTypeToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<cz.kolomet.domain.codelist.CategoryType, java.lang.String>() {
            public String convert(CategoryType categoryType) {
                return new StringBuilder().append(categoryType.getCodeKey()).append(' ').append(categoryType.getCodeDescription()).toString();
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
    
    public Converter<CountryState, String> ApplicationConversionServiceFactoryBean.getCountryStateToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<cz.kolomet.domain.codelist.CountryState, java.lang.String>() {
            public String convert(CountryState countryState) {
                return new StringBuilder().append(countryState.getCodeKey()).append(' ').append(countryState.getCodeDescription()).toString();
            }
        };
    }
    
    public Converter<Long, CountryState> ApplicationConversionServiceFactoryBean.getIdToCountryStateConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.codelist.CountryState>() {
            public cz.kolomet.domain.codelist.CountryState convert(java.lang.Long id) {
                return countryStateRepository.findOne(id);
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
    
    public Converter<Producer, String> ApplicationConversionServiceFactoryBean.getProducerToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<cz.kolomet.domain.codelist.Producer, java.lang.String>() {
            public String convert(Producer producer) {
                return new StringBuilder().append(producer.getCodeKey()).append(' ').append(producer.getCodeDescription()).append(' ').append(producer.getName()).toString();
            }
        };
    }
    
    public Converter<Long, Producer> ApplicationConversionServiceFactoryBean.getIdToProducerConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.codelist.Producer>() {
            public cz.kolomet.domain.codelist.Producer convert(java.lang.Long id) {
                return countryStateService.findProducer(id);
            }
        };
    }
    
    public Converter<String, Producer> ApplicationConversionServiceFactoryBean.getStringToProducerConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, cz.kolomet.domain.codelist.Producer>() {
            public cz.kolomet.domain.codelist.Producer convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Producer.class);
            }
        };
    }
    
    public Converter<Region, String> ApplicationConversionServiceFactoryBean.getRegionToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<cz.kolomet.domain.codelist.Region, java.lang.String>() {
            public String convert(Region region) {
                return new StringBuilder().append(region.getCodeKey()).append(' ').append(region.getCodeDescription()).toString();
            }
        };
    }
    
    public Converter<Long, Region> ApplicationConversionServiceFactoryBean.getIdToRegionConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.codelist.Region>() {
            public cz.kolomet.domain.codelist.Region convert(java.lang.Long id) {
                return regionRepository.findOne(id);
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
    
    public Converter<SellerStatus, String> ApplicationConversionServiceFactoryBean.getSellerStatusToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<cz.kolomet.domain.codelist.SellerStatus, java.lang.String>() {
            public String convert(SellerStatus sellerStatus) {
                return new StringBuilder().append(sellerStatus.getCodeKey()).append(' ').append(sellerStatus.getCodeDescription()).append(' ').append(sellerStatus.getPriority()).toString();
            }
        };
    }
    
    public Converter<Long, SellerStatus> ApplicationConversionServiceFactoryBean.getIdToSellerStatusConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, cz.kolomet.domain.codelist.SellerStatus>() {
            public cz.kolomet.domain.codelist.SellerStatus convert(java.lang.Long id) {
                return sellerStatusRepository.findOne(id);
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
        registry.addConverter(getPhotoUrlToStringConverter());
        registry.addConverter(getIdToPhotoUrlConverter());
        registry.addConverter(getStringToPhotoUrlConverter());
        registry.addConverter(getProductToStringConverter());
        registry.addConverter(getIdToProductConverter());
        registry.addConverter(getStringToProductConverter());
        registry.addConverter(getProductAttributeToStringConverter());
        registry.addConverter(getIdToProductAttributeConverter());
        registry.addConverter(getStringToProductAttributeConverter());
        registry.addConverter(getSellerToStringConverter());
        registry.addConverter(getIdToSellerConverter());
        registry.addConverter(getStringToSellerConverter());
        registry.addConverter(getCategoryToStringConverter());
        registry.addConverter(getIdToCategoryConverter());
        registry.addConverter(getStringToCategoryConverter());
        registry.addConverter(getCategoryTypeToStringConverter());
        registry.addConverter(getIdToCategoryTypeConverter());
        registry.addConverter(getStringToCategoryTypeConverter());
        registry.addConverter(getCountryStateToStringConverter());
        registry.addConverter(getIdToCountryStateConverter());
        registry.addConverter(getStringToCountryStateConverter());
        registry.addConverter(getProducerToStringConverter());
        registry.addConverter(getIdToProducerConverter());
        registry.addConverter(getStringToProducerConverter());
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