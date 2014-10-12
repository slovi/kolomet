package cz.kolomet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import cz.kolomet.domain.codelist.SellerStatus;

@Repository
public interface SellerStatusRepository extends JpaRepository<SellerStatus, Long>, JpaSpecificationExecutor<SellerStatus> {
	
	public SellerStatus findByCodeKey(String codeKey);
	
}
