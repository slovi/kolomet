// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.domain;

import cz.kolomet.domain.Place;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

privileged aspect Place_Roo_Equals {
    
    public boolean Place.equals(Object obj) {
        if (!(obj instanceof Place)) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        Place rhs = (Place) obj;
        return new EqualsBuilder().append(address, rhs.address).append(bikeRoadNr, rhs.bikeRoadNr).append(created, rhs.created).append(createdBy, rhs.createdBy).append(description, rhs.description).append(gpsLocation, rhs.gpsLocation).append(id, rhs.id).append(lastModified, rhs.lastModified).append(lastModifiedBy, rhs.lastModifiedBy).append(name, rhs.name).append(placeType, rhs.placeType).append(qualityRanking, rhs.qualityRanking).isEquals();
    }
    
    public int Place.hashCode() {
        return new HashCodeBuilder().append(address).append(bikeRoadNr).append(created).append(createdBy).append(description).append(gpsLocation).append(id).append(lastModified).append(lastModifiedBy).append(name).append(placeType).append(qualityRanking).toHashCode();
    }
    
}
