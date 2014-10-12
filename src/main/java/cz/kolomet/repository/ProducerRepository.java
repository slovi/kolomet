package cz.kolomet.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import cz.kolomet.domain.Producer;

@Repository
public interface ProducerRepository extends JpaSpecificationExecutor<Producer>, JpaRepository<Producer, Long> {
	
}
