package cz.kolomet.repository;

import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.QueryHints;
import org.springframework.stereotype.Repository;

import cz.kolomet.domain.codelist.FigureHeight;

@Repository
public interface FigureHeightRepository extends JpaRepository<FigureHeight, Long>, JpaSpecificationExecutor<FigureHeight> {
	
	@QueryHints({ @QueryHint(name = "org.hibernate.cacheable", value ="true") })
	public List<FigureHeight> findAll(Sort sort);
	
}
