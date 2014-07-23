// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.domain;

import cz.kolomet.domain.Place;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect Place_Roo_Json {
    
    public String Place.toJson() {
        return new JSONSerializer()
        .exclude("*.class").serialize(this);
    }
    
    public String Place.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }
    
    public static Place Place.fromJsonToPlace(String json) {
        return new JSONDeserializer<Place>()
        .use(null, Place.class).deserialize(json);
    }
    
    public static String Place.toJsonArray(Collection<Place> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String Place.toJsonArray(Collection<Place> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<Place> Place.fromJsonArrayToPlaces(String json) {
        return new JSONDeserializer<List<Place>>()
        .use("values", Place.class).deserialize(json);
    }
    
}
