package cz.kolomet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import cz.kolomet.domain.ApplicationUserAddress;

@Repository
public interface ApplicationUserAddressRepository extends JpaRepository<ApplicationUserAddress, Long>, JpaSpecificationExecutor<ApplicationUserAddress> {
	
}
