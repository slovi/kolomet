// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.domain;

import cz.kolomet.domain.Entity;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.Table;
import javax.persistence.Version;

privileged aspect Entity_Roo_Jpa_Entity {
    
    declare @type: Entity: @MappedSuperclass;
    
    declare @type: Entity: @Table(schema = "sa");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Entity.id;
    
    @Version
    @Column(name = "version")
    private Integer Entity.version;
    
    public Long Entity.getId() {
        return this.id;
    }
    
    public void Entity.setId(Long id) {
        this.id = id;
    }
    
    public Integer Entity.getVersion() {
        return this.version;
    }
    
    public void Entity.setVersion(Integer version) {
        this.version = version;
    }
    
}
