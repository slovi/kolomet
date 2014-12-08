package cz.kolomet.util;

import java.util.Iterator;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

public class PageDto {
	
	private final Page<?> page;
	
	public PageDto(Page<?> page) {
		this.page = page;
	}

	public Iterator<?> iterator() {
		return page.iterator();
	}

	public int getTotalPages() {
		return page.getTotalPages();
	}

	public int getNumber() {
		return page.getNumber();
	}

	public long getTotalElements() {
		return page.getTotalElements();
	}

	public int getSize() {
		return page.getSize();
	}

	public int getNumberOfElements() {
		return page.getNumberOfElements();
	}

	public List<?> getContent() {
		return page.getContent();
	}

	public boolean hasContent() {
		return page.hasContent();
	}

	public Sort getSort() {
		return page.getSort();
	}

	public boolean isFirst() {
		return page.isFirst();
	}

	public boolean isLast() {
		return page.isLast();
	}

	public boolean hasNext() {
		return page.hasNext();
	}

	public boolean hasPrevious() {
		return page.hasPrevious();
	}

	public Pageable nextPageable() {
		return page.nextPageable();
	}

	public Pageable previousPageable() {
		return page.previousPageable();
	}
	
}
