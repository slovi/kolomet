package cz.kolomet.service.impl;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cz.kolomet.domain.Producer;
import cz.kolomet.service.ProducerService;

public class ProducerServiceImpl implements ProducerService {
	
	public Page<Producer> findProducerEntries(Pageable pageable) {
		return producerRepository.findAll(pageable);
	}
	
}
