package cz.kolomet.service;

import java.util.List;

import cz.kolomet.domain.codelist.SellerStatus;

public interface SellerStatusService {
	
	public SellerStatus findSellerStatus(String code);
	

	public abstract long countAllSellerStatuses();


	public abstract void deleteSellerStatus(SellerStatus sellerStatus);


	public abstract SellerStatus findSellerStatus(Long id);


	public abstract List<SellerStatus> findAllSellerStatuses();


	public abstract List<SellerStatus> findSellerStatusEntries(int firstResult, int maxResults);


	public abstract void saveSellerStatus(SellerStatus sellerStatus);


	public abstract SellerStatus updateSellerStatus(SellerStatus sellerStatus);

}
