package cz.kolomet.domain;

import java.util.List;

import javax.persistence.ManyToMany;

public interface Commented {
	
	public List<? extends ProductComment> getComments();
	
	@ManyToMany
	public List<ApplicationUser> getLikes();

}
