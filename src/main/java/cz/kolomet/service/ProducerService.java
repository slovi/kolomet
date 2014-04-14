package cz.kolomet.service;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.layers.service.RooService;

import cz.kolomet.domain.Producer;

@RooService(domainTypes = { cz.kolomet.domain.Producer.class })
public interface ProducerService {
	
	public Page<Producer> findProducerEntries(Pageable pageable);
	
}
