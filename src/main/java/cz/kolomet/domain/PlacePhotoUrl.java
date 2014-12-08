package cz.kolomet.domain;
import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.BatchSize;

@Entity
@BatchSize(size = 3)
public class PlacePhotoUrl extends BasePhoto implements Serializable {
	
	public static final String PHOTO_URL_PREFIX = "place";

	@NotNull
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "PLACE_ID")
	private Place place;
	
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
