// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.domain.codelist;

import cz.kolomet.domain.codelist.CategoryType;
import cz.kolomet.domain.codelist.ProductAttributeType;

privileged aspect ProductAttributeType_Roo_JavaBean {
    
    public CategoryType ProductAttributeType.getCategoryType() {
        return this.categoryType;
    }
    
    public void ProductAttributeType.setCategoryType(CategoryType categoryType) {
        this.categoryType = categoryType;
    }
    
    public String ProductAttributeType.getUnits() {
        return this.units;
    }
    
    public void ProductAttributeType.setUnits(String units) {
        this.units = units;
    }
    
    public Boolean ProductAttributeType.getRequired() {
        return this.required;
    }
    
    public void ProductAttributeType.setRequired(Boolean required) {
        this.required = required;
    }
    
}
