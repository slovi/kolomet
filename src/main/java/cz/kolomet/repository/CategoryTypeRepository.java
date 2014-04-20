package cz.kolomet.repository;

import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import cz.kolomet.domain.codelist.CategoryType;

@RooJpaRepository(domainType = CategoryType.class)
public interface CategoryTypeRepository {
	
	public CategoryType findByCodeKey(String codeKey);
	
}
