package cz.kolomet.service;

import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cz.kolomet.domain.codelist.FigureHeight;

public interface FigureHeightService {
	
	public Page<FigureHeight> findFigureHeightEntries(Pageable pageable);
	

	public abstract long countAllFigureHeights();


	public abstract void deleteFigureHeight(FigureHeight figureHeight);


	public abstract FigureHeight findFigureHeight(Long id);


	public abstract List<FigureHeight> findAllFigureHeights();


	public abstract List<FigureHeight> findFigureHeightEntries(int firstResult, int maxResults);


	public abstract void saveFigureHeight(FigureHeight figureHeight);


	public abstract FigureHeight updateFigureHeight(FigureHeight figureHeight);

}
