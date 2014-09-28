package cz.kolomet.domain;
import java.util.Collection;

import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

import org.springframework.roo.addon.equals.RooEquals;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;

import flexjson.JSONSerializer;

@RooJavaBean
@RooToString
@RooJpaEntity(inheritanceType = "TABLE_PER_CLASS")
@RooEquals
@RooSerializable
public class PlacePhotoUrl extends BasePhoto {
	
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
