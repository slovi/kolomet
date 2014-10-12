package cz.kolomet.service;
import java.util.List;


import cz.kolomet.domain.PhotoContainerService;
import cz.kolomet.domain.PhotoUrl;
import cz.kolomet.domain.Product;

public interface PhotoUrlService extends PhotoContainerService {
	
	public List<PhotoUrl> findByProduct(Product product);
	

	public abstract long countAllPhotoUrls();


	public abstract void deletePhotoUrl(PhotoUrl photoUrl);


	public abstract PhotoUrl findPhotoUrl(Long id);


	public abstract List<PhotoUrl> findAllPhotoUrls();


	public abstract List<PhotoUrl> findPhotoUrlEntries(int firstResult, int maxResults);


	public abstract void savePhotoUrl(PhotoUrl photoUrl);


	public abstract PhotoUrl updatePhotoUrl(PhotoUrl photoUrl);

}
