package cz.kolomet.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import cz.kolomet.domain.PhotoUrl;
import cz.kolomet.domain.Product;

@Repository
public interface PhotoUrlRepository extends JpaRepository<PhotoUrl, Long>, JpaSpecificationExecutor<PhotoUrl> {
	
	public List<PhotoUrl> findByProduct(Product product);
	
}
