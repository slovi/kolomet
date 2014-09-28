package cz.kolomet.repository;

import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import cz.kolomet.domain.ApplicationPermission;

@RooJpaRepository(domainType = ApplicationPermission.class)
public interface ApplicationPermissionRepository {
}
