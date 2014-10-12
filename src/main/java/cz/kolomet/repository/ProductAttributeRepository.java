package cz.kolomet.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import cz.kolomet.domain.Product;
import cz.kolomet.domain.ProductAttribute;

@Repository
public interface ProductAttributeRepository extends JpaRepository<ProductAttribute, Long>, JpaSpecificationExecutor<ProductAttribute> {
	
	@Query("select pa from ProductAttribute pa inner join pa.attributeType at where pa.product = :product order by at.sequenceNr desc")
	public List<ProductAttribute> findByProductOrderByAttributeType_SequenceNr(@Param("product") Product product);
	
}
