package cz.kolomet.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cz.kolomet.domain.codelist.Codelist;
import cz.kolomet.domain.codelist.FigureHeight;
import cz.kolomet.repository.FigureHeightRepository;
import cz.kolomet.service.FigureHeightService;

@Service
@Transactional
public class FigureHeightServiceImpl implements FigureHeightService {
	
	public Page<FigureHeight> findFigureHeightEntries(Pageable pageable) {
		return figureHeightRepository.findAll(pageable);
	}
	
    public List<FigureHeight> findAllFigureHeights() {
        return figureHeightRepository.findAll(Codelist.defaultSort());
    }
	

	@Autowired
    FigureHeightRepository figureHeightRepository;

	public long countAllFigureHeights() {
        return figureHeightRepository.count();
    }

	public void deleteFigureHeight(FigureHeight figureHeight) {
        figureHeightRepository.delete(figureHeight);
    }

	public FigureHeight findFigureHeight(Long id) {
        return figureHeightRepository.findOne(id);
    }

	public List<FigureHeight> findFigureHeightEntries(int firstResult, int maxResults) {
        return figureHeightRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }

	public void saveFigureHeight(FigureHeight figureHeight) {
        figureHeightRepository.save(figureHeight);
    }

	public FigureHeight updateFigureHeight(FigureHeight figureHeight) {
        return figureHeightRepository.save(figureHeight);
    }
}
