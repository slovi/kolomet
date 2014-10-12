package cz.kolomet.domain;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import cz.kolomet.domain.codelist.PlaceType;
import cz.kolomet.domain.codelist.Region;
import cz.kolomet.dto.FileInfo;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;

@Entity
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public class Place extends BaseDomainEntity implements Commented, PhotoContainer, Serializable {

    @NotNull
    private String name;

    private String description;

    @NotNull
    @ManyToOne
    private PlaceType placeType;
    
    @Embedded
    private PlaceAddress address;
    
    @Embedded
	private GpsLocation gpsLocation;
    
    @ManyToOne
    @NotNull
    private Region region;

    private String bikeRoadNr;

    private Double qualityRanking = 0d;
    
    private Integer nrOfRankings = 0;
    
    private String descriptionLink;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "place")
    private List<PlacePhotoUrl> placePhotoUrls = new ArrayList<PlacePhotoUrl>();

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "place")
    private List<PlaceComment> comments = new ArrayList<PlaceComment>();
    
    @Transient
    private List<FileInfo> fileInfos = new ArrayList<FileInfo>();
    
    public static String toJsonArray(Collection<Place> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*").serialize(collection);
    }
    
    public void increaseRate(Integer value) {
    	
    	if (qualityRanking == null) {
    		this.qualityRanking = 0d;
    	}
    	if (nrOfRankings == null) {
    		this.nrOfRankings = 0;
    	}
    	
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

	public List<FileInfo> getFileInfos() {
		return fileInfos;
	}

	public void setFileInfos(List<FileInfo> fileInfos) {
		this.fileInfos = fileInfos;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public PlaceType getPlaceType() {
		return placeType;
	}

	public void setPlaceType(PlaceType placeType) {
		this.placeType = placeType;
	}

	public PlaceAddress getAddress() {
		return address;
	}

	public void setAddress(PlaceAddress address) {
		this.address = address;
	}

	public GpsLocation getGpsLocation() {
		return gpsLocation;
	}

	public void setGpsLocation(GpsLocation gpsLocation) {
		this.gpsLocation = gpsLocation;
	}

	public Region getRegion() {
		return region;
	}

	public void setRegion(Region region) {
		this.region = region;
	}

	public String getBikeRoadNr() {
		return bikeRoadNr;
	}

	public void setBikeRoadNr(String bikeRoadNr) {
		this.bikeRoadNr = bikeRoadNr;
	}

	public Double getQualityRanking() {
		return qualityRanking;
	}

	public void setQualityRanking(Double qualityRanking) {
		this.qualityRanking = qualityRanking;
	}

	public Integer getNrOfRankings() {
		return nrOfRankings;
	}

	public void setNrOfRankings(Integer nrOfRankings) {
		this.nrOfRankings = nrOfRankings;
	}

	public String getDescriptionLink() {
		return descriptionLink;
	}

	public void setDescriptionLink(String descriptionLink) {
		this.descriptionLink = descriptionLink;
	}

	public List<PlacePhotoUrl> getPlacePhotoUrls() {
		return placePhotoUrls;
	}

	public void setPlacePhotoUrls(List<PlacePhotoUrl> placePhotoUrls) {
		this.placePhotoUrls = placePhotoUrls;
	}

	public List<PlaceComment> getComments() {
		return comments;
	}

	public void setComments(List<PlaceComment> comments) {
		this.comments = comments;
	}

	public String toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }

	public static Place fromJsonToPlace(String json) {
        return new JSONDeserializer<Place>().use(null, Place.class).deserialize(json);
    }

	public static String toJsonArray(Collection<Place> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }

	public static Collection<Place> fromJsonArrayToPlaces(String json) {
        return new JSONDeserializer<List<Place>>().use(null, ArrayList.class).use("values", Place.class).deserialize(json);
    }

}
