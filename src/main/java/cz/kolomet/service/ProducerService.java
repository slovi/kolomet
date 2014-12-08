package cz.kolomet.service;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cz.kolomet.domain.Producer;

public interface ProducerService {
	
	
	public Page<Producer> findProducerEntries(Pageable pageable);
	

	public long countAllProducers();


	public void deleteProducer(Producer producer);


	public Producer findProducer(Long id);


	public List<Producer> findAllProducers();


	public List<Producer> findProducerEntries(int firstResult, int maxResults);


	public void saveProducer(Producer producer);


	public Producer updateProducer(Producer producer);

}
