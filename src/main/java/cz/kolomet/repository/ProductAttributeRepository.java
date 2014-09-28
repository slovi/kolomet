package cz.kolomet.repository;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import cz.kolomet.domain.Product;
import cz.kolomet.domain.ProductAttribute;

@RooJpaRepository(domainType = ProductAttribute.class)
public interface ProductAttributeRepository {
	
	@Query("select pa from ProductAttribute pa inner join pa.attributeType at where pa.product = :product order by at.sequenceNr desc")
	public List<ProductAttribute> findByProductOrderByAttributeType_SequenceNr(@Param("product") Product product);
	
}
