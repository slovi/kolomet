package cz.kolomet.domain;
import cz.kolomet.domain.codelist.BicycleCategory;
import cz.kolomet.domain.codelist.FigureHeight;
import cz.kolomet.domain.codelist.ProductColor;
import cz.kolomet.domain.codelist.ProductUsage;
import cz.kolomet.repository.ProductRepository;
import cz.kolomet.service.ProductService;
import java.math.BigDecimal;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.stereotype.Component;

@Configurable
@Component
public class ProductDataOnDemand {

	private Random rnd = new SecureRandom();

	private List<Product> data;

	@Autowired
    ApplicationUserDataOnDemand applicationUserDataOnDemand;

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
        setCopiedFrom(obj, index);
        setCreated(obj, index);
        setDeliveryForFree(obj, index);
        setDescription(obj, index);
        setDiscount(obj, index);
        setEnabled(obj, index);
        setFigureHeight(obj, index);
        setFinalPrice(obj, index);
        setLastModified(obj, index);
        setPrice(obj, index);
        setProducer(obj, index);
        setProductColor(obj, index);
        setProductName(obj, index);
        setProductState(obj, index);
        setProductUsage(obj, index);
        setSeller(obj, index);
        setValidFrom(obj, index);
        setValidTo(obj, index);
        setWeight(obj, index);
        return obj;
    }

	public void setBicycleCategory(Product obj, int index) {
        BicycleCategory bicycleCategory = null;
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
        Category category = null;
        obj.setCategory(category);
    }

	public void setCopiedFrom(Product obj, int index) {
        Product copiedFrom = obj;
        obj.setCopiedFrom(copiedFrom);
    }

	public void setCreated(Product obj, int index) {
        Date created = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setCreated(created);
    }

	public void setDeliveryForFree(Product obj, int index) {
        Boolean deliveryForFree = Boolean.TRUE;
        obj.setDeliveryForFree(deliveryForFree);
    }

	public void setDescription(Product obj, int index) {
        String description = "description_" + index;
        obj.setDescription(description);
    }

	public void setDiscount(Product obj, int index) {
        BigDecimal discount = BigDecimal.valueOf(index);
        obj.setDiscount(discount);
    }

	public void setEnabled(Product obj, int index) {
        Boolean enabled = true;
        obj.setEnabled(enabled);
    }

	public void setFigureHeight(Product obj, int index) {
        FigureHeight figureHeight = null;
        obj.setFigureHeight(figureHeight);
    }

	public void setFinalPrice(Product obj, int index) {
        BigDecimal finalPrice = BigDecimal.valueOf(index);
        if (finalPrice.compareTo(new BigDecimal("1")) == -1 || finalPrice.compareTo(new BigDecimal("1000000")) == 1) {
            finalPrice = new BigDecimal("1000000");
        }
        obj.setFinalPrice(finalPrice);
    }

	public void setLastModified(Product obj, int index) {
        Date lastModified = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setLastModified(lastModified);
    }

	public void setPrice(Product obj, int index) {
        BigDecimal price = BigDecimal.valueOf(index);
        if (price.compareTo(new BigDecimal("1")) == -1 || price.compareTo(new BigDecimal("1000000")) == 1) {
            price = new BigDecimal("1000000");
        }
        obj.setPrice(price);
    }

	public void setProducer(Product obj, int index) {
        Producer producer = null;
        obj.setProducer(producer);
    }

	public void setProductColor(Product obj, int index) {
        ProductColor productColor = null;
        obj.setProductColor(productColor);
    }

	public void setProductName(Product obj, int index) {
        String productName = "productName_" + index;
        if (productName.length() > 50) {
            productName = productName.substring(0, 50);
        }
        obj.setProductName(productName);
    }

	public void setProductState(Product obj, int index) {
        ProductState productState = null;
        obj.setProductState(productState);
    }

	public void setProductUsage(Product obj, int index) {
        ProductUsage productUsage = null;
        obj.setProductUsage(productUsage);
    }

	public void setSeller(Product obj, int index) {
        Seller seller = null;
        obj.setSeller(seller);
    }

	public void setValidFrom(Product obj, int index) {
        Date validFrom = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setValidFrom(validFrom);
    }

	public void setValidTo(Product obj, int index) {
        Date validTo = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setValidTo(validTo);
    }

	public void setWeight(Product obj, int index) {
        Double weight = new Integer(index).doubleValue();
        obj.setWeight(weight);
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
