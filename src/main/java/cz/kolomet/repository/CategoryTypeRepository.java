package cz.kolomet.repository;

import java.util.List;

import cz.kolomet.domain.codelist.CategoryType;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = CategoryType.class)
public interface CategoryTypeRepository {
	
	public List<CategoryType> findByCodeKey(String codeKey);
	
}
