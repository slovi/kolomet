package cz.kolomet.repository;

import cz.kolomet.domain.Page;
import cz.kolomet.util.repository.CustomRepository;

public interface PageRepository extends CustomRepository<Page, Long>{

	public cz.kolomet.domain.Page findPageByName(String name);

}
