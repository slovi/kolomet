// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.domain;

import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;

privileged aspect PlacePhotoUrl_Roo_Jpa_Entity {
    
    declare @type: PlacePhotoUrl: @Entity;
    
    declare @type: PlacePhotoUrl: @Inheritance(strategy = InheritanceType.TABLE_PER_CLASS);
    
}
