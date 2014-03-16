package cz.kolomet.repository;
import cz.kolomet.domain.ProductAttribute;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = ProductAttribute.class)
public interface ProductAttributeRepository {
}
