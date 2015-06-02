package cz.kolomet.repository;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Repository;

import cz.kolomet.domain.NewsItem;
import cz.kolomet.util.repository.CustomRepository;

@Repository
public interface NewsItemRepository extends CustomRepository<NewsItem, Long> {
	
	//@QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })
	public List<NewsItem> findAll(Specification<NewsItem> specification);
	
}
