package cz.kolomet.repository;

import cz.kolomet.domain.ApplicationPermission;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = ApplicationPermission.class)
public interface ApplicationPermissionRepository {
}
