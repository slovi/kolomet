// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.domain;

import cz.kolomet.domain.Person;
import java.io.Serializable;

privileged aspect Person_Roo_Serializable {
    
    declare parents: Person implements Serializable;
    
    private static final long Person.serialVersionUID = 1L;
    
}
