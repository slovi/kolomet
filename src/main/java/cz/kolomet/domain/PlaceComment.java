package cz.kolomet.domain;
import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
@Entity
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)public class PlaceComment extends Comment implements Serializable {
	
	@ManyToOne
	private PlaceComment parent;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "parent")
	private List<PlaceComment> children;
	
	@NotNull
	@ManyToOne
	private Place place;
	
	public Place getPlace() {
		return place;
	}

	public void setPlace(Place place) {
		this.place = place;
	}

	public PlaceComment getParent() {
        return this.parent;
    }

	public void setParent(PlaceComment parent) {
        this.parent = parent;
    }

	public List<PlaceComment> getChildren() {
        return this.children;
    }

	public void setChildren(List<PlaceComment> children) {
        this.children = children;
    }
}