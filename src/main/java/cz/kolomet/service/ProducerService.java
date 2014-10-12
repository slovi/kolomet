package cz.kolomet.service;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cz.kolomet.domain.Producer;

public interface ProducerService {
	
	public Page<Producer> findProducerEntries(Pageable pageable);
	

	public abstract long countAllProducers();


	public abstract void deleteProducer(Producer producer);


	public abstract Producer findProducer(Long id);


	public abstract List<Producer> findAllProducers();


	public abstract List<Producer> findProducerEntries(int firstResult, int maxResults);


	public abstract void saveProducer(Producer producer);


	public abstract Producer updateProducer(Producer producer);

}
