package cz.kolomet.repository;

import cz.kolomet.domain.SellerPhotoUrl;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = SellerPhotoUrl.class)
public interface SellerPhotoUrlRepository {
}
