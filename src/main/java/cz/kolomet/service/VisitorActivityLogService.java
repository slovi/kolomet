package cz.kolomet.service;

import cz.kolomet.domain.Product;
import cz.kolomet.domain.Seller;
import cz.kolomet.domain.VisitorActivityLog.VisitorActivityType;

public interface VisitorActivityLogService {
	
	public void saveVisitorActivityLog(Long sellerId, Long productId, String ipAddress, VisitorActivityType activityType);
	
	public void saveVisitorActivityLog(Seller seller, Product product, String ipAddress, VisitorActivityType activityType);
	
}
