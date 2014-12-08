package cz.kolomet.util.repository;

import java.io.Serializable;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.QueryHint;
import javax.persistence.TypedQuery;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.data.jpa.repository.support.SimpleJpaRepository;
import org.springframework.data.repository.NoRepositoryBean;

@NoRepositoryBean
public class CustomRepositoryImpl<T, ID extends Serializable> extends SimpleJpaRepository<T, ID> implements CustomRepository<T, ID>{

	private EntityManager em;
	private Class<T> domainClass;
	
	public CustomRepositoryImpl(Class<T> domainClass, EntityManager em) {
		super(domainClass, em);
		this.domainClass = domainClass;
		this.em = em;
	}
	
	@Override
	public T getOne(ID id) {
		return em.getReference(domainClass, id);
	}

	@Override
	public List<T> findAllWithoutCountQuery(Specification<T> specification, Pageable pageable) {

		TypedQuery<T> query = getQuery(specification, pageable.getSort());
		
		query.setFirstResult(pageable.getOffset());
		query.setMaxResults(pageable.getPageSize());

		return query.getResultList();
	}
	
	@QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })
	public List<T> findAllWithoutCountQueryCacheable(Specification<T> specification, Pageable pageable) {
		return findAllWithoutCountQuery(specification, pageable);
	}
	
	public Page<T> findCurrentAndNextPage(Specification<T> specification, Pageable pageable) {
		TypedQuery<T> query = getQuery(specification, pageable.getSort());
		
		query.setFirstResult(pageable.getOffset());
		query.setMaxResults(pageable.getPageSize() * 2);

		List<T> content = query.getResultList();
		if (content.size() > pageable.getPageSize()) {
			return new PageImpl<T>(content.subList(0, pageable.getPageSize()), pageable, content.size());
		} else {
			return new PageImpl<T>(content, pageable, content.size());
		}
	}
	
	public Page<T> findCurrentAndNextPageCacheable(Specification<T> specification, Pageable pageable) {
		return findCurrentAndNextPage(specification, pageable);
	}
	
}
