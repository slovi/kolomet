package cz.kolomet.domain;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Transient;
import javax.swing.text.DefaultEditorKit.BeepAction;
import javax.validation.constraints.NotNull;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.annotations.BatchSize;

import cz.kolomet.domain.codelist.PlaceType;
import cz.kolomet.domain.codelist.Region;
import cz.kolomet.dto.FileInfo;

@Entity
public class Place extends BaseDomainEntity implements Commented, PhotoContainer, Serializable, SimpleNameIdentifiable {

    @NotNull
    private String name;
    
    private String simplifiedName;

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
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "OWNER_ID")
    private ApplicationUser owner;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "place")
    @BatchSize(size = 20)
    private List<PlacePhotoUrl> placePhotoUrls = new ArrayList<PlacePhotoUrl>();

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "place")
    private List<PlaceComment> comments = new ArrayList<PlaceComment>();
    
    @ManyToMany(fetch = FetchType.LAZY, mappedBy = "visitedPlaces", cascade = CascadeType.REMOVE)
    private List<ApplicationUser> visitedUsers = new ArrayList<ApplicationUser>();
    
    @Transient
    private List<FileInfo> fileInfos = new ArrayList<FileInfo>();
    
    public void simplifyName() {
    	if (StringUtils.isBlank(this.simplifiedName)) {
    		this.simplifiedName = cz.kolomet.util.StringUtils.simplify(this.getName() + "__" + this.getId());
    	}
    }
    
    public void simplifyNameAnyway() {
    	this.simplifiedName = cz.kolomet.util.StringUtils.simplify(this.getName() + "__" + this.getId());
    }
    
    public void addVisitedUser(ApplicationUser applicationUser) {
    	this.visitedUsers.add(applicationUser);
    	applicationUser.getVisitedPlaces().add(this);
    }
    
    public void removeVisitedUser(ApplicationUser applicationUser) {
    	this.visitedUsers.remove(applicationUser);
    	applicationUser.getVisitedPlaces().remove(this);
    }
    
    @Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((getName() == null) ? 0 : getName().hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (!(obj instanceof Place))
			return false;
		Place other = (Place) obj;
		if (getName() == null) {
			if (other.getName() != null)
				return false;
		} else if (!getName().equals(other.getName()))
			return false;
		return true;
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

	public String getSimplifiedName() {
		this.simplifyName(); // TODO temp
		return simplifiedName;
	}

	public void setSimplifiedName(String simplifiedName) {
		this.simplifiedName = simplifiedName;
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

	public ApplicationUser getOwner() {
		return owner;
	}

	public void setOwner(ApplicationUser owner) {
		this.owner = owner;
	}

	public List<PlacePhotoUrl> getPlacePhotoUrls() {
		return placePhotoUrls;
	}

	public void setPlacePhotoUrls(List<PlacePhotoUrl> placePhotoUrls) {
		this.placePhotoUrls = placePhotoUrls;
	}

	public List<ApplicationUser> getVisitedUsers() {
		return visitedUsers;
	}

	public void setVisitedUsers(List<ApplicationUser> visitedUsers) {
		this.visitedUsers = visitedUsers;
	}

	public List<PlaceComment> getComments() {
		return comments;
	}

	public void setComments(List<PlaceComment> comments) {
		this.comments = comments;
	}

}
