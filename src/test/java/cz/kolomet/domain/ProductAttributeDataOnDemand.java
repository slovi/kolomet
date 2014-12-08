package cz.kolomet.domain;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.stereotype.Component;

import cz.kolomet.domain.codelist.ProductAttributeType;

@Component
@Configurable
public class ProductAttributeDataOnDemand {

	@Autowired
	private DomainEntityDataOnDemand domainEntityDataOnDemand;
	
	@SuppressWarnings("unchecked")
	public List<ProductAttribute> getNewTransientProductAttributeList(Product product, int index) {
		List<ProductAttributeType> attributeTypes = (List<ProductAttributeType>) domainEntityDataOnDemand.getDomainEntites(ProductAttributeType.class);
		List<ProductAttribute> productAttributes = new ArrayList<ProductAttribute>();
		int attrIndex = 1;
		for (ProductAttributeType productAttributeType: attributeTypes) {
			ProductAttribute productAttribute = new ProductAttribute();
			productAttribute.setProduct(product);
			productAttribute.setAttributeType(productAttributeType);
			productAttribute.setAttributeValue("value_" + index + "_" + attrIndex++);
			productAttributes.add(productAttribute);
		}
		return productAttributes;
	}

}
