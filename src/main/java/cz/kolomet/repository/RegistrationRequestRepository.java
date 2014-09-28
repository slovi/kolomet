package cz.kolomet.repository;

import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import cz.kolomet.domain.RegistrationRequest;

@RooJpaRepository(domainType = RegistrationRequest.class)
public interface RegistrationRequestRepository {
}
