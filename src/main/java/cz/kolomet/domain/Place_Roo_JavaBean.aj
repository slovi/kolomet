// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.domain;

import cz.kolomet.domain.Address;
import cz.kolomet.domain.GpsLocation;
import cz.kolomet.domain.Place;
import cz.kolomet.domain.PlaceComment;
import cz.kolomet.domain.PlacePhotoUrl;
import cz.kolomet.domain.codelist.PlaceType;
import cz.kolomet.domain.codelist.Region;
import java.util.List;

privileged aspect Place_Roo_JavaBean {
    
    public String Place.getName() {
        return this.name;
    }
    
    public void Place.setName(String name) {
        this.name = name;
    }
    
    public String Place.getDescription() {
        return this.description;
    }
    
    public void Place.setDescription(String description) {
        this.description = description;
    }
    
    public PlaceType Place.getPlaceType() {
        return this.placeType;
    }
    
    public void Place.setPlaceType(PlaceType placeType) {
        this.placeType = placeType;
    }
    
    public Address Place.getAddress() {
        return this.address;
    }
    
    public void Place.setAddress(Address address) {
        this.address = address;
    }
    
    public Region Place.getRegion() {
        return this.region;
    }
    
    public void Place.setRegion(Region region) {
        this.region = region;
    }
    
    public GpsLocation Place.getGpsLocation() {
        return this.gpsLocation;
    }
    
    public void Place.setGpsLocation(GpsLocation gpsLocation) {
        this.gpsLocation = gpsLocation;
    }
    
    public String Place.getBikeRoadNr() {
        return this.bikeRoadNr;
    }
    
    public void Place.setBikeRoadNr(String bikeRoadNr) {
        this.bikeRoadNr = bikeRoadNr;
    }
    
    public Double Place.getQualityRanking() {
        return this.qualityRanking;
    }
    
    public void Place.setQualityRanking(Double qualityRanking) {
        this.qualityRanking = qualityRanking;
    }
    
    public Integer Place.getNrOfRankings() {
        return this.nrOfRankings;
    }
    
    public void Place.setNrOfRankings(Integer nrOfRankings) {
        this.nrOfRankings = nrOfRankings;
    }
    
    public String Place.getDescriptionLink() {
        return this.descriptionLink;
    }
    
    public void Place.setDescriptionLink(String descriptionLink) {
        this.descriptionLink = descriptionLink;
    }
    
    public List<PlacePhotoUrl> Place.getPlacePhotoUrls() {
        return this.placePhotoUrls;
    }
    
    public void Place.setPlacePhotoUrls(List<PlacePhotoUrl> placePhotoUrls) {
        this.placePhotoUrls = placePhotoUrls;
    }
    
    public List<PlaceComment> Place.getComments() {
        return this.comments;
    }
    
    public void Place.setComments(List<PlaceComment> comments) {
        this.comments = comments;
    }
    
}
