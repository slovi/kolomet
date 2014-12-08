package cz.kolomet.util.repository;

import java.io.Serializable;
import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.data.repository.NoRepositoryBean;

@NoRepositoryBean
public interface CustomRepository<T, ID extends Serializable> extends JpaRepository<T, ID>, JpaSpecificationExecutor<T>{
	
	T getOne(ID id);
	
	List<T> findAllWithoutCountQuery(Specification<T> specification, Pageable pageable);
	
	@QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })
	List<T> findAllWithoutCountQueryCacheable(Specification<T> specification, Pageable pageable);
	
	Page<T> findCurrentAndNextPage(Specification<T> specification, Pageable pageable);
	
	@QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })
	Page<T> findCurrentAndNextPageCacheable(Specification<T> specification, Pageable pageable);

}
