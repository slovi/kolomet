package cz.kolomet.domain;
import java.io.Serializable;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

import flexjson.JSONSerializer;

@Entity
public class PlacePhotoUrl extends BasePhoto implements Serializable {
	
	public static final String PHOTO_URL_PREFIX = "place";

	@NotNull
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "PLACE_ID")
	private Place place;
	
    public static String toJsonArray(Collection<PlacePhotoUrl> collection, String[] fields) {
        return new JSONSerializer().include(fields).exclude("*").serialize(collection);
    }
	
	@Override
	protected String getPhotoUrlPrefix() {
		return PHOTO_URL_PREFIX;
	}

	@Override
	protected Long getParentContainerId() {
		return getParentContainer().getId();
	}

	@Override
	public PhotoContainer getParentContainer() {
		return place;
	}

	public Place getPlace() {
		return place;
	}

	public void setPlace(Place place) {
		this.place = place;
	}

}
