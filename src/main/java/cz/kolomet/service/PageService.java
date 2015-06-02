package cz.kolomet.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface PageService {
	
	
	public cz.kolomet.domain.Page findPageByName(String name);
	
	
	public Page<cz.kolomet.domain.Page> findPageEntries(Pageable pageable);
	
	
	public long countAllPages();


	public void deletePage(cz.kolomet.domain.Page page);


	public cz.kolomet.domain.Page findPage(Long id);


	public List<cz.kolomet.domain.Page> findAllPages();


	public List<cz.kolomet.domain.Page> findPageEntries(int firstResult, int maxResults);


	public void savePage(cz.kolomet.domain.Page page);


	public cz.kolomet.domain.Page updatePage(cz.kolomet.domain.Page page);

}
