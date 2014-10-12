package cz.kolomet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import cz.kolomet.domain.codelist.FigureHeight;

@Repository
public interface FigureHeightRepository extends JpaRepository<FigureHeight, Long>, JpaSpecificationExecutor<FigureHeight> {
	
}
