// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.domain.codelist;

import cz.kolomet.domain.GpsLocation;
import cz.kolomet.domain.codelist.Region;

privileged aspect Region_Roo_JavaBean {
    
    public GpsLocation Region.getGpsLocation() {
        return this.gpsLocation;
    }
    
    public void Region.setGpsLocation(GpsLocation gpsLocation) {
        this.gpsLocation = gpsLocation;
    }
    
    public String Region.getGoogleAlias() {
        return this.googleAlias;
    }
    
    public void Region.setGoogleAlias(String googleAlias) {
        this.googleAlias = googleAlias;
    }
    
}
