package cz.kolomet.domain.codelist;
import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;

import cz.kolomet.domain.PlaceTypeColor;

@Entity
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)public class PlaceType extends Codelist implements Serializable {
	
	private PlaceTypeColor placeTypeColor;

	public PlaceTypeColor getPlaceTypeColor() {
        return this.placeTypeColor;
    }

	public void setPlaceTypeColor(PlaceTypeColor placeTypeColor) {
        this.placeTypeColor = placeTypeColor;
    }

}
