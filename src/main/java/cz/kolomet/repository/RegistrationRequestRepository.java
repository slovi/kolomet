package cz.kolomet.repository;

import cz.kolomet.domain.RegistrationRequest;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = RegistrationRequest.class)
public interface RegistrationRequestRepository {
}
