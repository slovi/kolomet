package cz.kolomet.repository;

import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import cz.kolomet.domain.NewsItemPhotoUrl;

@RooJpaRepository(domainType = NewsItemPhotoUrl.class)
public interface NewsItemPhotoUrlRepository {
}
