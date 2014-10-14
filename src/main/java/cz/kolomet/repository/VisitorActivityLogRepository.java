package cz.kolomet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import cz.kolomet.domain.VisitorActivityLog;

@Repository
public interface VisitorActivityLogRepository extends JpaSpecificationExecutor<VisitorActivityLog>, JpaRepository<VisitorActivityLog, Long>{

}
