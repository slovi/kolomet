package cz.kolomet.domain;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Embedded;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.springframework.roo.addon.equals.RooEquals;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;

import cz.kolomet.domain.codelist.PlaceType;
import cz.kolomet.domain.codelist.Region;
import flexjson.JSONSerializer;

@RooJavaBean
@RooToString
@RooJpaEntity(inheritanceType = "TABLE_PER_CLASS")
@RooEquals
@RooSerializable
@RooJson
public class Place extends DomainEntity implements Commented, PhotoContainer {

    @NotNull
    private String name;

    private String description;

    @NotNull
    @ManyToOne
    private PlaceType placeType;

    @Embedded
    private Address address;
    
    @ManyToOne
    private Region region;

    @NotNull
    @Embedded
    private GpsLocation gpsLocation;

    private String bikeRoadNr;

    private Double qualityRanking = 0d;
    
    private Integer nrOfRankings = 0;
    
    private String descriptionLink;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "place")
    private List<PlacePhotoUrl> placePhotoUrls = new ArrayList<PlacePhotoUrl>();

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "place")
    private List<PlaceComment> comments = new ArrayList<PlaceComment>();
    
    @Transient
    private List<String> fileNames = new ArrayList<String>();
    
    public static String toJsonArray(Collection<Place> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*").serialize(collection);
    }
    
    public void increaseRate(Integer value) {
    	Double actualRanking = qualityRanking * nrOfRankings;
    	if (nrOfRankings == null) {
    		this.nrOfRankings = 1;
    	} else {
    		nrOfRankings++;
    	}
    	this.qualityRanking = (actualRanking + value) / nrOfRankings;
    }
    
    @Override
    public String getPhotoType() {
    	return PlacePhotoUrl.PHOTO_URL_PREFIX;
    }

	@Override
	public List<? extends Photo> getPhotos() {
		return placePhotoUrls;
	}

	@Override
	public Photo addPhoto(String fileName, String contentType) {
		PlacePhotoUrl photoUrl = new PlacePhotoUrl();
		photoUrl.setFileName(fileName);
    	photoUrl.setContentType(contentType);
    	photoUrl.setPlace(this);
    	this.placePhotoUrls.add(photoUrl);
		return photoUrl;
	}

}
