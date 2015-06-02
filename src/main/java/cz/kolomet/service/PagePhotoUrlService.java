package cz.kolomet.service;

import java.util.List;

import cz.kolomet.domain.PagePhotoUrl;
import cz.kolomet.domain.PhotoContainerService;

public interface PagePhotoUrlService extends PhotoContainerService {
	
	public abstract long countAllPagePhotoUrls();


	public abstract void deletePagePhotoUrl(PagePhotoUrl pagePhotoUrl);


	public abstract PagePhotoUrl findPagePhotoUrl(Long id);


	public abstract List<PagePhotoUrl> findAllPagePhotoUrls();


	public abstract List<PagePhotoUrl> findPagePhotoUrlEntries(int firstResult, int maxResults);


	public abstract void savePagePhotoUrl(PagePhotoUrl pagePhotoUrl);


	public abstract PagePhotoUrl updatePagePhotoUrl(PagePhotoUrl pagePhotoUrl);

}
