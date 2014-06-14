package cz.kolomet.service.impl;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cz.kolomet.domain.Producer;
import cz.kolomet.domain.codelist.Codelist;
import cz.kolomet.service.ProducerService;

public class ProducerServiceImpl implements ProducerService {
	
	public Page<Producer> findProducerEntries(Pageable pageable) {
		return producerRepository.findAll(pageable);
	}
	
    public List<Producer> findAllProducers() {
        return producerRepository.findAll(Codelist.defaultSort());
    }
	
}
