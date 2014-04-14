package cz.kolomet.service.impl;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cz.kolomet.domain.codelist.FigureHeight;
import cz.kolomet.service.FigureHeightService;

public class FigureHeightServiceImpl implements FigureHeightService {
	
	public Page<FigureHeight> findFigureHeightEntries(Pageable pageable) {
		return figureHeightRepository.findAll(pageable);
	}
	
}
