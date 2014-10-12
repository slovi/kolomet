package cz.kolomet.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cz.kolomet.domain.codelist.Codelist;
import cz.kolomet.domain.codelist.Region;
import cz.kolomet.repository.RegionRepository;
import cz.kolomet.service.RegionService;

@Service
@Transactional
public class RegionServiceImpl implements RegionService {
	
	public Page<Region> findRegionEntries(Pageable pageable) {
		return regionRepository.findAll(pageable);
	}
	
    public List<Region> findAllRegions() {
        return regionRepository.findAll(Codelist.defaultSort());
    }
    
    public Region findByGoogleAlias(String googleAlias) {
    	return regionRepository.findByGoogleAlias(googleAlias);
    }
    

	@Autowired
    RegionRepository regionRepository;

	public long countAllRegions() {
        return regionRepository.count();
    }

	public void deleteRegion(Region region) {
        regionRepository.delete(region);
    }

	public Region findRegion(Long id) {
        return regionRepository.findOne(id);
    }

	public List<Region> findRegionEntries(int firstResult, int maxResults) {
        return regionRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }

	public void saveRegion(Region region) {
        regionRepository.save(region);
    }

	public Region updateRegion(Region region) {
        return regionRepository.save(region);
    }
}
