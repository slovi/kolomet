package cz.kolomet.service;

import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cz.kolomet.domain.codelist.Region;

public interface RegionService {
	
	public Page<Region> findRegionEntries(Pageable pageable);  
	
	public Region findByGoogleAlias(String googleAlias);
	

	public abstract long countAllRegions();


	public abstract void deleteRegion(Region region);


	public abstract Region findRegion(Long id);


	public abstract List<Region> findAllRegions();


	public abstract List<Region> findRegionEntries(int firstResult, int maxResults);


	public abstract void saveRegion(Region region);


	public abstract Region updateRegion(Region region);

}
