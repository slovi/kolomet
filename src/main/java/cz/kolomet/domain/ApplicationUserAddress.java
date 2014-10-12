package cz.kolomet.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Version;

import org.apache.commons.lang3.StringUtils;
import org.joda.time.DateTime;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class ApplicationUserAddress extends Address implements DomainEntity {
	
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
	
	private String salutation;
	
	private String degree;
	
	private String name;
	
	private String email;
	
	private String phoneNumber;
	
	private AddressType addressType;
	
    public String getContactString() {
    	StringBuilder builder = new StringBuilder();
    	if (StringUtils.isNotEmpty(email)) {
    		builder.append(email);
    		builder.append(", ");
    	}
    	if (StringUtils.isNotEmpty(phoneNumber)) {
    		builder.append(phoneNumber);
    	}
    	return builder.toString();
    }

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

	public String getSalutation() {
		return salutation;
	}

	public void setSalutation(String salutation) {
		this.salutation = salutation;
	}

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public AddressType getAddressType() {
		return addressType;
	}

	public void setAddressType(AddressType addressType) {
		this.addressType = addressType;
	}

}
