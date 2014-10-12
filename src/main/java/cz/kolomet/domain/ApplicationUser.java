package cz.kolomet.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import cz.kolomet.dto.FileInfo;

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
public class ApplicationUser extends BaseDomainEntity implements PhotoContainer, Serializable {
	
	private String name;
	
	private String surname;
	
	private String nickname;

	private String phone;
	
	// is email
	private String username;

	private String password;
	
	private Boolean enabled;
	
	private String conditionVersion;
	
	private Date conditionAgreement;
	
	private String token;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "applicationUser", fetch = FetchType.LAZY)
	private List<ApplicationUserPhoto> applicationUserPhotos = new ArrayList<ApplicationUserPhoto>();
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "APPLICATION_USER_ID")
	@Fetch(FetchMode.SUBSELECT)
	private List<ApplicationUserAddress> addresses = new ArrayList<ApplicationUserAddress>();
		
	@ManyToMany
	  @JoinTable(
	      name="APPLICATION_USER_ROLE",
	      joinColumns={@JoinColumn(name="USER_ID", referencedColumnName="ID")},
	      inverseJoinColumns={@JoinColumn(name="ROLE_ID", referencedColumnName="ID")})
	private List<ApplicationRole> roles = new ArrayList<ApplicationRole>();
	
	@Transient
    private List<FileInfo> fileInfos = new ArrayList<FileInfo>();
	
	public String getLabelName() {
		return StringUtils.isNotBlank(nickname) ? nickname : this.name + " " + this.surname;
	}
	
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

	protected ApplicationUserAddress getAddressByTypeNullSafe(AddressType addressType) {
		ApplicationUserAddress address = getAddressByType(addressType);
		if (address != null) {
			return address;
		} else {
			ApplicationUserAddress newAddress = new ApplicationUserAddress();
			newAddress.setAddressType(addressType);
			this.addresses.add(newAddress);
			return newAddress;
		}
	}
	
	protected ApplicationUserAddress getAddressByType(AddressType addressType) {
		for (ApplicationUserAddress address: addresses) {
			if (address.getAddressType() != null && address.getAddressType().equals(addressType)) {
				return address;
			}
		}
		return null;
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
	
	public String getNickname() {
		return this.nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
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
	
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}
	
	public void addAddress(ApplicationUserAddress address) {
		this.addresses.add(address);
	} 

	public List<ApplicationUserAddress> getAddresses() {
		return addresses;
	}

	public void setAddresses(List<ApplicationUserAddress> addresses) {
		this.addresses = addresses;
	}

	public List<ApplicationRole> getRoles() {
		return roles;
	}

	public void setRoles(List<ApplicationRole> roles) {
		this.roles = roles;
	}

	public List<FileInfo> getFileInfos() {
		return fileInfos;
	}

	public void setFileInfos(List<FileInfo> fileInfos) {
		this.fileInfos = fileInfos;
	}
	
}
