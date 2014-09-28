package cz.kolomet.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.EntityListeners;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import javax.persistence.Table;
import javax.persistence.Version;

import org.joda.time.DateTime;
import org.springframework.data.domain.Auditable;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.equals.RooEquals;
import org.springframework.roo.addon.tostring.RooToString;

@RooToString(excludeFields = {"createdBy", "lastModifiedBy", "createdDate", "lastModifiedDate"})
@RooEquals(excludeFields = {"createdBy", "lastModifiedBy", "createdDate", "lastModifiedDate"})
@Table(schema = "sa")
@MappedSuperclass
@EntityListeners({ org.springframework.data.jpa.domain.support.AuditingEntityListener.class })
public abstract class DomainEntity implements Auditable<ApplicationUser, Long>, Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
    
    @Version
    @Column(name = "version")
    private Integer version;
	
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CREATED_ID", updatable = false)
    private ApplicationUser createdBy;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "LAST_MODIFIED_ID")
    private ApplicationUser lastModifiedBy;

    @DateTimeFormat(style = "MM")
    @Column(updatable = false)
    private Date created;

    @DateTimeFormat(style = "MM")
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
    
    protected void setBaseParamsAsNull() {
    	setId(null);
    	setCreated(null);
    	setCreatedBy(null);
    	setLastModified(null);
    	setLastModifiedBy(null);
    	setVersion(null);
    }

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getVersion() {
		return version;
	}

	public void setVersion(Integer version) {
		this.version = version;
	}

	public ApplicationUser getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(ApplicationUser createdBy) {
		this.createdBy = createdBy;
	}

	public ApplicationUser getLastModifiedBy() {
		return lastModifiedBy;
	}

	public void setLastModifiedBy(ApplicationUser lastModifiedBy) {
		this.lastModifiedBy = lastModifiedBy;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public Date getLastModified() {
		return lastModified;
	}

	public void setLastModified(Date lastModified) {
		this.lastModified = lastModified;
	}
    
}
