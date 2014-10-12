package cz.kolomet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import cz.kolomet.domain.NewsItem;

@Repository
public interface NewsItemRepository extends JpaSpecificationExecutor<NewsItem>, JpaRepository<NewsItem, Long> {
	 
}
