package cz.kolomet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import cz.kolomet.domain.NewsItemPhotoUrl;

@Repository
public interface NewsItemPhotoUrlRepository extends JpaSpecificationExecutor<NewsItemPhotoUrl>, JpaRepository<NewsItemPhotoUrl, Long> {
}
