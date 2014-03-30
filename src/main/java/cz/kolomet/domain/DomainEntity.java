package cz.kolomet.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.EntityListeners;

import org.joda.time.DateTime;
import org.springframework.data.domain.Auditable;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.equals.RooEquals;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaEntity(schema = "sa", mappedSuperclass = true)
@RooEquals
@RooSerializable
@EntityListeners({ org.springframework.data.jpa.domain.support.AuditingEntityListener.class })
public abstract class DomainEntity implements Auditable<ApplicationUser, Long> {

    @Column(updatable = false)
    private ApplicationUser createdBy;

    @Column(updatable = false)
    private ApplicationUser lastModifiedBy;

    @DateTimeFormat(style = "M-")
    private Date created;

    @DateTimeFormat(style = "M-")
    private Date lastModified;

    @Override
    public boolean isNew() {
        return getId() == null;
    }
    
    @Override
    public DateTime getCreatedDate() {
    	return new DateTime(created);
    }
    
    @Override
    public DateTime getLastModifiedDate() {
    	return new DateTime(lastModified);
    }
    
    @Override
    public void setCreatedDate(DateTime creationDate) {
    	this.created = creationDate.toDate();
    }
    
    @Override
    public void setLastModifiedDate(DateTime lastModifiedDate) {
    	this.lastModified = lastModifiedDate.toDate();
    }
    
}
