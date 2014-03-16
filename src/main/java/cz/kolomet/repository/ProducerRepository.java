package cz.kolomet.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;
import org.springframework.stereotype.Repository;

import cz.kolomet.domain.codelist.Producer;

@RooJpaRepository(domainType = Producer.class)
@Repository
public interface ProducerRepository extends JpaRepository<Producer, Long>, JpaSpecificationExecutor<Producer> {
}
