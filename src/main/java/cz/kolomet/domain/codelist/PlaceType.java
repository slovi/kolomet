package cz.kolomet.domain.codelist;
import java.io.Serializable;

import javax.persistence.Cacheable;
import javax.persistence.Entity;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import cz.kolomet.domain.PlaceTypeColor;

@Entity
@Cacheable
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)public class PlaceType extends Codelist implements Serializable {
	
	private PlaceTypeColor placeTypeColor;

	public PlaceTypeColor getPlaceTypeColor() {
        return this.placeTypeColor;
    }

	public void setPlaceTypeColor(PlaceTypeColor placeTypeColor) {
        this.placeTypeColor = placeTypeColor;
    }

}
