package cz.kolomet.service;

import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cz.kolomet.domain.codelist.Region;

public interface RegionService {
	
	
	public Page<Region> findRegionEntries(Pageable pageable);  
	
	
	public Region findByGoogleAlias(String googleAlias);
	
	
	public Region findByGoogleAliasEn(String googleAliasEn);
	

	public long countAllRegions();


	public void deleteRegion(Region region);


	public Region findRegion(Long id);


	public List<Region> findAllRegions();


	public List<Region> findRegionEntries(int firstResult, int maxResults);


	public void saveRegion(Region region);


	public Region updateRegion(Region region);

}
