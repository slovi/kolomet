package cz.kolomet.repository;
import cz.kolomet.domain.codelist.Producer;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Producer.class)
public interface ProducerRepository {
}
