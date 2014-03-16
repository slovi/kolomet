package cz.kolomet.repository;
import cz.kolomet.domain.Seller;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Seller.class)
public interface SellerRepository {
}
