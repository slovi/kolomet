package cz.kolomet.repository;

import cz.kolomet.domain.NewsItemPhotoUrl;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = NewsItemPhotoUrl.class)
public interface NewsItemPhotoUrlRepository {
}
