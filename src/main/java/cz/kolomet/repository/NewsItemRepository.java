package cz.kolomet.repository;

import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import cz.kolomet.domain.NewsItem;

@RooJpaRepository(domainType = NewsItem.class)
public interface NewsItemRepository {
	
}
