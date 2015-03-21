package cz.kolomet.domain;
import java.math.BigDecimal;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.stereotype.Component;

import cz.kolomet.domain.codelist.BicycleCategory;
import cz.kolomet.domain.codelist.FigureHeight;
import cz.kolomet.domain.codelist.ProductColor;
import cz.kolomet.domain.codelist.ProductUsage;
import cz.kolomet.repository.ProductRepository;
import cz.kolomet.service.ProductService;

@Configurable
@Component
public class ProductDataOnDemand {

	private Random rnd = new SecureRandom();

	private List<Product> data;

	@Autowired
    ApplicationUserDataOnDemand applicationUserDataOnDemand;
	
	@Autowired
	DomainEntityDataOnDemand domainEntityDataOnDemand;
	
	@Autowired
	ProductAttributeDataOnDemand productAttributeDataOnDemand;
	
	@Autowired
	PhotoUrlDataOnDemand photoUrlDataOnDemand;

	@Autowired
    ProductService productService;

	@Autowired
    ProductRepository productRepository;

	
	public Product getNewTransientProduct(int index) {
        Product obj = new Product();
        setBicycleCategory(obj, index);
        setBuyUrl(obj, index);
        setCanSendToAllCountry(obj, index);
        setCategory(obj, index);
        setDeliveryForFree(obj, index);
        setDescription(obj, index);
        setEnabled(obj, index);
        setFigureHeight(obj, index);
        setPrice(obj, index);
        setFinalPrice(obj, index);
        setDiscount(obj, index);
        setProducer(obj, index);
        setProductColor(obj, index);
        setProductName(obj, index);
        setProductUsage(obj, index);
        setSeller(obj, index);
        setValidFrom(obj, index);
        setValidTo(obj, index);
        setWeight(obj, index);
        setProductAttributes(obj, index);
        setPhotoUrls(obj, index);
        return obj;
    }

	public void setBicycleCategory(Product obj, int index) {
        BicycleCategory bicycleCategory = domainEntityDataOnDemand.getRandomDomainEntity(BicycleCategory.class);
        obj.setBicycleCategory(bicycleCategory);
    }

	public void setBuyUrl(Product obj, int index) {
        String buyUrl = "buyUrl_" + index;
        if (buyUrl.length() > 255) {
            buyUrl = buyUrl.substring(0, 255);
        }
        obj.setBuyUrl(buyUrl);
    }

	public void setCanSendToAllCountry(Product obj, int index) {
        Boolean canSendToAllCountry = Boolean.TRUE;
        obj.setCanSendToAllCountry(canSendToAllCountry);
    }

	public void setCategory(Product obj, int index) {
        Category category = domainEntityDataOnDemand.getRandomDomainEntity(Category.class);
        obj.setCategory(category);
    }

	public void setDeliveryForFree(Product obj, int index) {
        Boolean deliveryForFree = Boolean.TRUE;
        obj.setDeliveryForFree(deliveryForFree);
    }

	public void setDescription(Product obj, int index) {
        String description = "description_" + index;
        obj.setDescription(description);
    }

	public void setDiscount(Product obj, int index) {;
        obj.setDiscount(obj.getPrice().subtract(obj.getFinalPrice()));
    }

	public void setEnabled(Product obj, int index) {
        Boolean enabled = true;
        obj.setEnabled(enabled);
    }

	public void setFigureHeight(Product obj, int index) {
        FigureHeight figureHeight = domainEntityDataOnDemand.getRandomDomainEntity(FigureHeight.class);
        obj.setFigureHeights(Arrays.asList(figureHeight));
    }
	
	public void setPrice(Product obj, int index) {
		BigDecimal price = BigDecimal.valueOf(rnd.nextInt(50000) + 10000);
		if (price.compareTo(new BigDecimal("1")) == -1 || price.compareTo(new BigDecimal("1000000")) == 1) {
			price = new BigDecimal("1000000");
		}
		obj.setPrice(price);
	}

	public void setFinalPrice(Product obj, int index) {
        BigDecimal finalPrice = BigDecimal.valueOf(rnd.nextInt(obj.getPrice().intValue() - 1000));
        if (finalPrice.compareTo(new BigDecimal("1")) == -1 || finalPrice.compareTo(new BigDecimal("1000000")) == 1) {
            finalPrice = new BigDecimal("1000000");
        }
        obj.setFinalPrice(finalPrice);
    }

	public void setProducer(Product obj, int index) {
        Producer producer = domainEntityDataOnDemand.getRandomDomainEntity(Producer.class);
        obj.setProducer(producer);
    }

	public void setProductColor(Product obj, int index) {
        ProductColor productColor = domainEntityDataOnDemand.getRandomDomainEntity(ProductColor.class);
        obj.setProductColors(Arrays.asList(productColor));
    }

	public void setProductName(Product obj, int index) {
        String productName = "productName_" + index;
        if (productName.length() > 50) {
            productName = productName.substring(0, 50);
        }
        obj.setProductName(productName);
    }

	public void setProductUsage(Product obj, int index) {
        ProductUsage productUsage = domainEntityDataOnDemand.getRandomDomainEntity(ProductUsage.class);
        obj.setProductUsage(productUsage);
    }

	public void setSeller(Product obj, int index) {
        Seller seller = domainEntityDataOnDemand.getRandomDomainEntity(Seller.class);
        obj.setSeller(seller);
    }

	public void setValidFrom(Product obj, int index) {
        obj.setValidFrom(new Date());
    }

	public void setValidTo(Product obj, int index) {
        obj.setValidTo(new DateTime(obj.getValidFrom()).plusMonths(12).toDate());
    }

	public void setWeight(Product obj, int index) {
        Double weight = new Integer(rnd.nextInt(20) + 1).doubleValue();
        obj.setWeight(weight);
    }
	
	public void setProductAttributes(Product obj, int index) {
		obj.setProductAttributes(productAttributeDataOnDemand.getNewTransientProductAttributeList(obj, index));
	}

	public void setPhotoUrls(Product obj, int index) {
		obj.setPhotoUrls(photoUrlDataOnDemand.getNewTransientPhotoUrlList(obj, index));
	}
	
	public Product getSpecificProduct(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Product obj = data.get(index);
        Long id = obj.getId();
        return productService.findProduct(id);
    }

	public Product getRandomProduct() {
        init();
        Product obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return productService.findProduct(id);
    }

	public boolean modifyProduct(Product obj) {
        return false;
    }

	public void init() {
        int from = 0;
        int to = 10;
        data = productService.findProductEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Product' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }        
        data = new ArrayList<Product>();
        for (int i = 0; i < 10; i++) {
            Product obj = getNewTransientProduct(i);
            try {
                productService.saveProduct(obj);
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            productRepository.flush();
            data.add(obj);
        }
    }
}
