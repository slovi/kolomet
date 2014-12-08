package cz.kolomet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import cz.kolomet.domain.ApplicationPermission;

@Repository
public interface ApplicationPermissionRepository extends JpaSpecificationExecutor<ApplicationPermission>, JpaRepository<ApplicationPermission, Long> {
}
