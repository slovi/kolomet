package cz.kolomet.repository;

import cz.kolomet.domain.NewsItem;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = NewsItem.class)
public interface NewsItemRepository {
}
