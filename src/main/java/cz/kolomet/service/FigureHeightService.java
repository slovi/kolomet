package cz.kolomet.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.layers.service.RooService;

import cz.kolomet.domain.codelist.FigureHeight;

@RooService(domainTypes = { cz.kolomet.domain.codelist.FigureHeight.class })
public interface FigureHeightService {
	
	public Page<FigureHeight> findFigureHeightEntries(Pageable pageable);
	
}
