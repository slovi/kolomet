package cz.kolomet.repository;

import cz.kolomet.domain.ApplicationRole;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = ApplicationRole.class)
public interface ApplicationRoleRepository {
}
