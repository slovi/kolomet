package cz.kolomet.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.springframework.roo.addon.equals.RooEquals;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString(excludeFields = {"createdBy", "lastModifiedBy", "createdDate", "lastModifiedDate", "seller", "roles"})
@RooJpaEntity(inheritanceType = "TABLE_PER_CLASS")
@RooEquals(excludeFields = {"createdBy", "lastModifiedBy", "createdDate", "lastModifiedDate", "seller", "roles"})
@RooSerializable
public class ApplicationUser extends DomainEntity implements PhotoContainer {
	
	private String name;
	
	private String surname;
	
	private String phone;
	
	// is email
	private String username;

	private String password;
	
	private Boolean enabled;
	
	private String conditionVersion;
	
	private Date conditionAgreement;
	
	private String token;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "applicationUser")
	private List<ApplicationUserPhoto> applicationUserPhotos = new ArrayList<ApplicationUserPhoto>();

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "SELLER_ID")
	private Seller seller;
		
	@ManyToMany
	  @JoinTable(
	      name="APPLICATION_USER_ROLE",
	      joinColumns={@JoinColumn(name="USER_ID", referencedColumnName="ID")},
	      inverseJoinColumns={@JoinColumn(name="ROLE_ID", referencedColumnName="ID")})
	private List<ApplicationRole> roles = new ArrayList<ApplicationRole>();
	
	@Override
	public List<? extends Photo> getPhotos() {
		return applicationUserPhotos;
	}
	
	public boolean getProfilePhotoEmpty() {
		return applicationUserPhotos.isEmpty();
	}
	
	public String getProfilePhotoUrl() {
		return getProfilePhotoEmpty() ? null : applicationUserPhotos.get(0).getThumbPhotoUrl();
	}
	
	@Override
	public String getPhotoType() {
		return ApplicationUserPhoto.PHOTO_URL_PREFIX;
	}
	
	@Override
	public Photo addPhoto(String fileName, String contentType) {
		
		ApplicationUserPhoto applicationUserPhoto = new ApplicationUserPhoto();
		applicationUserPhoto.setFileName(fileName);
		applicationUserPhoto.setContentType(contentType);
		applicationUserPhoto.setApplicationUser(this);
    	this.applicationUserPhotos.add(applicationUserPhoto);
		return applicationUserPhoto;
	}
	
	public void addRole(ApplicationRole applicationRole) {
		this.roles.add(applicationRole);
	}
	
	public String getNickname() {
		return this.seller != null ? this.seller.getSellerName() : this.name + "." + this.surname;
	}

	public List<ApplicationUserPhoto> getApplicationUserPhotos() {
		return applicationUserPhotos;
	}

	public void setApplicationUserPhotos(List<ApplicationUserPhoto> applicationUserPhotos) {
		this.applicationUserPhotos = applicationUserPhotos;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getConditionVersion() {
		return conditionVersion;
	}

	public void setConditionVersion(String conditionVersion) {
		this.conditionVersion = conditionVersion;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public Date getConditionAgreement() {
		return conditionAgreement;
	}

	public void setConditionAgreement(Date conditionAgreement) {
		this.conditionAgreement = conditionAgreement;
	}
	
}
