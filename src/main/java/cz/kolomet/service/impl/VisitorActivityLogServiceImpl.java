package cz.kolomet.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cz.kolomet.domain.Product;
import cz.kolomet.domain.Seller;
import cz.kolomet.domain.VisitorActivityLog;
import cz.kolomet.domain.VisitorActivityLog.VisitorActivityType;
import cz.kolomet.repository.VisitorActivityLogRepository;
import cz.kolomet.service.ProductService;
import cz.kolomet.service.SellerService;
import cz.kolomet.service.VisitorActivityLogService;

@Service
public class VisitorActivityLogServiceImpl implements VisitorActivityLogService {

	@Autowired
	private VisitorActivityLogRepository visitorActivityLogRespository;
	
	@Autowired
	private SellerService sellerService;
	
	@Autowired
	private ProductService productService;
	
	@Override
	public void saveVisitorActivityLog(Long sellerId, Long productId, String ipAddress, VisitorActivityType activityType) {
		
		Seller seller = sellerId != null ? sellerService.findSeller(sellerId) : null; 
		Product product = productId != null ? productService.findProduct(productId) : null;
		saveVisitorActivityLog(seller, product, ipAddress, activityType);
	}
	
	@Override
	public void saveVisitorActivityLog(Seller sellerId, Product productId, String ipAddress, VisitorActivityType activityType) {
		VisitorActivityLog visitorActivityLog = new VisitorActivityLog();
		visitorActivityLog.setActivityType(activityType);
		visitorActivityLog.setSeller(sellerId);
		visitorActivityLog.setProduct(productId);
		visitorActivityLog.setIpAddress(ipAddress);
		visitorActivityLogRespository.save(visitorActivityLog);
	}

}
