package cz.kolomet.domain;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.roo.addon.dod.RooDataOnDemand;

import cz.kolomet.domain.codelist.PlaceType;
import cz.kolomet.domain.codelist.PlaceTypeDataOnDemand;

@RooDataOnDemand(entity = Place.class)
public class PlaceDataOnDemand {
	
	@Autowired
	private PlaceTypeDataOnDemand data;
	
	public void setPlaceType(Place obj, int index) {
        PlaceType placeType = data.getRandomPlaceType();
        obj.setPlaceType(placeType);
    }
	
}
