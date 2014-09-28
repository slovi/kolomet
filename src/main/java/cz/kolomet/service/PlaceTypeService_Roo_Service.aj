// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.service;

import java.util.List;

import cz.kolomet.domain.codelist.PlaceType;

privileged aspect PlaceTypeService_Roo_Service {
    
    public abstract long PlaceTypeService.countAllPlaceTypes();    
    public abstract void PlaceTypeService.deletePlaceType(PlaceType placeType);    
    public abstract PlaceType PlaceTypeService.findPlaceType(Long id);    
    public abstract List<PlaceType> PlaceTypeService.findAllPlaceTypes();    
    public abstract List<PlaceType> PlaceTypeService.findPlaceTypeEntries(int firstResult, int maxResults);    
    public abstract void PlaceTypeService.savePlaceType(PlaceType placeType);    
    public abstract PlaceType PlaceTypeService.updatePlaceType(PlaceType placeType);    
}
