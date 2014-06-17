package cz.kolomet.domain;

import java.util.List;

public interface Commented {
	
	public List<? extends ProductComment> getComments();

}
