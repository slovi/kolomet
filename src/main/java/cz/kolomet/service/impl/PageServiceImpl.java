package cz.kolomet.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cz.kolomet.repository.PageRepository;
import cz.kolomet.service.PageService;

@Service
@Transactional
public class PageServiceImpl implements PageService {

	@Autowired
	private PageRepository pageRepository;
	
	
	@Override
	public cz.kolomet.domain.Page findPageByName(String name) {
		return pageRepository.findPageByName(name);
	}
	
	@Override
	public Page<cz.kolomet.domain.Page> findPageEntries(Pageable pageable) {
		return pageRepository.findAll(pageable);
	}

	@Override
	public long countAllPages() {
		return pageRepository.count();
	}

	@Override
	public void deletePage(cz.kolomet.domain.Page page) {
		pageRepository.delete(page);
	}

	@Override
	public cz.kolomet.domain.Page findPage(Long id) {
		return pageRepository.findOne(id);
	}

	@Override
	public List<cz.kolomet.domain.Page> findAllPages() {
		return pageRepository.findAll();
	}

	@Override
	public List<cz.kolomet.domain.Page> findPageEntries(int firstResult, int maxResults) {
		return pageRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
	}

	@Override
	public void savePage(cz.kolomet.domain.Page page) {
		pageRepository.save(page);
	}

	@Override
	public cz.kolomet.domain.Page updatePage(cz.kolomet.domain.Page page) {
		return pageRepository.save(page);
	}

}
