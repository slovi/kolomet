package cz.kolomet.repository;
import java.util.List;

import cz.kolomet.domain.PhotoUrl;
import cz.kolomet.domain.Product;

import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = PhotoUrl.class)
public interface PhotoUrlRepository {
	
	public List<PhotoUrl> findByProduct(Product product);
	
}
