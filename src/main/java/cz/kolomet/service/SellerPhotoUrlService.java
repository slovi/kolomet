package cz.kolomet.service;

import java.util.List;

import cz.kolomet.domain.PhotoContainerService;
import cz.kolomet.domain.SellerPhotoUrl;

public interface SellerPhotoUrlService extends PhotoContainerService {
	

	public abstract long countAllSellerPhotoUrls();


	public abstract void deleteSellerPhotoUrl(SellerPhotoUrl sellerPhotoUrl);


	public abstract SellerPhotoUrl findSellerPhotoUrl(Long id);


	public abstract List<SellerPhotoUrl> findAllSellerPhotoUrls();


	public abstract List<SellerPhotoUrl> findSellerPhotoUrlEntries(int firstResult, int maxResults);


	public abstract void saveSellerPhotoUrl(SellerPhotoUrl sellerPhotoUrl);


	public abstract SellerPhotoUrl updateSellerPhotoUrl(SellerPhotoUrl sellerPhotoUrl);

}
