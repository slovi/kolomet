package cz.kolomet.repository;

import org.springframework.stereotype.Repository;

import cz.kolomet.domain.NewsItem;
import cz.kolomet.util.repository.CustomRepository;

@Repository
public interface NewsItemRepository extends CustomRepository<NewsItem, Long> {
	
}
