package cz.kolomet.repository;

import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import cz.kolomet.domain.SellerPhotoUrl;

@RooJpaRepository(domainType = SellerPhotoUrl.class)
public interface SellerPhotoUrlRepository {
}
