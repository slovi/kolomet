package cz.kolomet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import cz.kolomet.domain.RegistrationRequest;

@Repository
public interface RegistrationRequestRepository extends JpaSpecificationExecutor<RegistrationRequest>, JpaRepository<RegistrationRequest, Long> {
}
