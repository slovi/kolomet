package cz.kolomet.service;

import java.util.List;

import cz.kolomet.domain.NewsItemPhotoUrl;
import cz.kolomet.domain.PhotoContainerService;

public interface NewsItemPhotoUrlService extends PhotoContainerService {
	

	public abstract long countAllNewsItemPhotoUrls();


	public abstract void deleteNewsItemPhotoUrl(NewsItemPhotoUrl newsItemPhotoUrl);


	public abstract NewsItemPhotoUrl findNewsItemPhotoUrl(Long id);


	public abstract List<NewsItemPhotoUrl> findAllNewsItemPhotoUrls();


	public abstract List<NewsItemPhotoUrl> findNewsItemPhotoUrlEntries(int firstResult, int maxResults);


	public abstract void saveNewsItemPhotoUrl(NewsItemPhotoUrl newsItemPhotoUrl);


	public abstract NewsItemPhotoUrl updateNewsItemPhotoUrl(NewsItemPhotoUrl newsItemPhotoUrl);

}
