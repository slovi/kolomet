// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.domain;

import cz.kolomet.domain.Person;

privileged aspect Person_Roo_JavaBean {
    
    public String Person.getSalutation() {
        return this.salutation;
    }
    
    public void Person.setSalutation(String salutation) {
        this.salutation = salutation;
    }
    
    public String Person.getDegree() {
        return this.degree;
    }
    
    public void Person.setDegree(String degree) {
        this.degree = degree;
    }
    
    public String Person.getName() {
        return this.name;
    }
    
    public void Person.setName(String name) {
        this.name = name;
    }
    
    public String Person.getSurname() {
        return this.surname;
    }
    
    public void Person.setSurname(String surname) {
        this.surname = surname;
    }
    
}
