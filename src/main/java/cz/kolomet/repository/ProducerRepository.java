package cz.kolomet.repository;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import cz.kolomet.domain.codelist.Producer;

@RooJpaRepository(domainType = Producer.class)
public interface ProducerRepository {
}