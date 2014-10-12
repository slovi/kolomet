package cz.kolomet.service.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cz.kolomet.domain.Producer;
import cz.kolomet.domain.codelist.Codelist;
import cz.kolomet.repository.ProducerRepository;
import cz.kolomet.service.ProducerService;

@Service
@Transactional
public class ProducerServiceImpl implements ProducerService {
	
	public Page<Producer> findProducerEntries(Pageable pageable) {
		return producerRepository.findAll(pageable);
	}
	
    public List<Producer> findAllProducers() {
        return producerRepository.findAll(Codelist.defaultSort());
    }
	

	@Autowired
    ProducerRepository producerRepository;

	public long countAllProducers() {
        return producerRepository.count();
    }

	public void deleteProducer(Producer producer) {
        producerRepository.delete(producer);
    }

	public Producer findProducer(Long id) {
        return producerRepository.findOne(id);
    }

	public List<Producer> findProducerEntries(int firstResult, int maxResults) {
        return producerRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }

	public void saveProducer(Producer producer) {
        producerRepository.save(producer);
    }

	public Producer updateProducer(Producer producer) {
        return producerRepository.save(producer);
    }
}
