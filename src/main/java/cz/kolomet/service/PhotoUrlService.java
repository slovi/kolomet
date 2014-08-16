package cz.kolomet.service;
import java.util.List;

import org.springframework.roo.addon.layers.service.RooService;

import cz.kolomet.domain.PhotoContainerService;
import cz.kolomet.domain.PhotoUrl;
import cz.kolomet.domain.Product;

@RooService(domainTypes = { cz.kolomet.domain.PhotoUrl.class })
public interface PhotoUrlService extends PhotoContainerService {
	
	public List<PhotoUrl> findByProduct(Product product);
	
}
