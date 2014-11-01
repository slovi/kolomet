package cz.kolomet.domain;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.annotations.BatchSize;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import cz.kolomet.domain.codelist.CountryState;
import cz.kolomet.domain.codelist.Region;
import cz.kolomet.domain.codelist.SellerStatus;

@Entity
@BatchSize(size = 9)
public class Seller extends BaseDomainEntity implements PhotoContainer, Serializable {
	
	@NotNull
	@Size(max = 20)
	private String sellerName;

    /**
     */
    @NotNull
    @Lob
    private String sellerDescription;
    
    private String sellerTitle;
    
    // zodpovedna osoba
    @Size(max = 20)
    private String personSalutation;
    
    @Size(max = 20)
    private String personDegree;
    
    @Size(max = 20)
    private String personName;
    
    @Size(max = 20)
    private String personSurname;
   
    private String personEmail;

    // ostatni
    @ManyToOne(fetch = FetchType.LAZY)
    private SellerStatus sellerStatus;
    
    @ManyToOne(fetch = FetchType.LAZY)
    private Region region;
    
    @Size(max = 255)
    @NotNull
    private String web;
    
    @Size(max = 255)
    private String saleType;
    
    @Size(max = 255)
    private String mapUrl;
    
    private Boolean enabled;
    
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "seller", cascade = CascadeType.ALL)
    private List<SellerPhotoUrl> sellerPhotoUrls = new ArrayList<SellerPhotoUrl>();
    
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "seller", cascade = CascadeType.ALL)
    private List<Product> products = new ArrayList<Product>();
    
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "APPLICATION_USER_ID")
	@Fetch(FetchMode.SUBSELECT)
	private List<SellerAddress> addresses = new ArrayList<SellerAddress>();
    
    @Override
    public String getPhotoType() {
    	return SellerPhotoUrl.PHOTO_URL_PREFIX;
    }
    
    public String getPersonString() {
    	
    	StringBuilder builder = new StringBuilder();
    	if (StringUtils.isNotEmpty(personSalutation)) {
    		builder.append(personSalutation);
    		builder.append(" ");
    	}
    	if (StringUtils.isNotEmpty(personDegree)) {
    		builder.append(personDegree);
    		builder.append(" ");
    	}
    	if (StringUtils.isNotEmpty(personName)) {
    		builder.append(personName);
    		builder.append(" ");
    	}
    	if (StringUtils.isNotEmpty(personSurname)) {
    		builder.append(personSurname);
    		builder.append(" ");
    	}
    	return builder.toString();
    }
    
    public String getAddressString() {
    	return getCorrespondenceAddress().getAddressString();
    }
    
    public String getBusinessAddressString() {
    	return getBusinessAddress().getAddressString();
    }
    
    public String getContactString() {
    	return getBusinessAddress().getContactString();
    }
    
    public void normalizeWebUrl() {
    	if (StringUtils.isNotEmpty(web) && !web.startsWith("http://")) {
    		this.web = "http://" + web; 
    	}
    }

	@Override
	public List<? extends Photo> getPhotos() {
		return sellerPhotoUrls;
	}

	@Override
	public Photo addPhoto(String fileName, String contentType) {
		final SellerPhotoUrl sellerPhotoUrl = new SellerPhotoUrl();
    	sellerPhotoUrl.setFileName(fileName);
    	sellerPhotoUrl.setContentType(contentType);
    	sellerPhotoUrl.setSeller(this);
    	this.getSellerPhotoUrls().add(sellerPhotoUrl);
		return sellerPhotoUrl;
	}
	
	protected SellerAddress getAddressByTypeNullSafe(AddressType addressType) {
		SellerAddress address = getAddressByType(addressType);
		if (address != null) {
			return address;
		} else {
			SellerAddress newAddress = new SellerAddress();
			newAddress.setAddressType(addressType);
			this.addresses.add(newAddress);
			return newAddress;
		}
	}
	
	protected SellerAddress getAddressByType(AddressType addressType) {
		for (SellerAddress address: addresses) {
			if (address.getAddressType() != null && address.getAddressType().equals(addressType)) {
				return address;
			}
		}
		return null;
	}

    public SellerAddress getCorrespondenceAddress() {
    	return getAddressByTypeNullSafe(AddressType.CORRESPONDENCE);
    }
    
    public SellerAddress getBusinessAddress() {
    	return getAddressByTypeNullSafe(AddressType.BUSINNES_PLACE);
    }
	
	public String getSellerName() {
		return sellerName;
	}

	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}

	public String getSellerDescription() {
		return sellerDescription;
	}

	public void setSellerDescription(String sellerDescription) {
		this.sellerDescription = sellerDescription;
	}

	public String getSellerTitle() {
		return sellerTitle;
	}

	public void setSellerTitle(String sellerTitle) {
		this.sellerTitle = sellerTitle;
	}
	
	public String getPersonSalutation() {
		return personSalutation;
	}

	public void setPersonSalutation(String personSalutation) {
		this.personSalutation = personSalutation;
	}

	public String getPersonDegree() {
		return personDegree;
	}

	public void setPersonDegree(String personDegree) {
		this.personDegree = personDegree;
	}

	public String getPersonName() {
		return personName;
	}

	public void setPersonName(String personName) {
		this.personName = personName;
	}

	public String getPersonSurname() {
		return personSurname;
	}

	public void setPersonSurname(String personSurname) {
		this.personSurname = personSurname;
	}

	public String getPersonEmail() {
		return personEmail;
	}

	public void setPersonEmail(String personEmail) {
		this.personEmail = personEmail;
	}

	public Long getBusinessAddressId() {
		return getBusinessAddress().getId();
	}
	
	public void setBusinessAddressId(Long id) {
		getBusinessAddress().setId(id);
	}
	
	public CountryState getBusinessCountry() {
		return getBusinessAddress().getCountryState();
	}

	public void setBusinessCountry(CountryState businessCountry) {
		getBusinessAddress().setCountryState(businessCountry);
	}

	public String getBusinessCity() {
		return getBusinessAddress().getCity();
	}

	public void setBusinessCity(String businessCity) {
		getBusinessAddress().setCity(businessCity);
	}

	public String getBusinessStreet() {
		return getBusinessAddress().getStreet();
	}

	public void setBusinessStreet(String businessStreet) {
		getBusinessAddress().setStreet(businessStreet);
	}

	public String getBusinessPostCode() {
		return getBusinessAddress().getPostCode();
	}

	public void setBusinessPostCode(String businessPostCode) {
		getBusinessAddress().setPostCode(businessPostCode);
	}

	public String getBusinessSalutation() {
		return getBusinessAddress().getSalutation();
	}

	public void setBusinessSalutation(String businessSalutation) {
		getBusinessAddress().setSalutation(businessSalutation);
	}

	public String getBusinessDegree() {
		return getBusinessAddress().getDegree();
	}

	public void setBusinessDegree(String businessDegree) {
		getBusinessAddress().setDegree(businessDegree);
	}

	public String getBusinessEmail() {
		return getBusinessAddress().getEmail();
	}

	public void setBusinessEmail(String businessEmail) {
		getBusinessAddress().setEmail(businessEmail);
	}

	public String getBusinessPhoneNumber() {
		return getBusinessAddress().getPhoneNumber();
	}

	public void setBusinessPhoneNumber(String businessPhoneNumber) {
		getBusinessAddress().setPhoneNumber(businessPhoneNumber);
	}
	
	public String getBusinessName() {
		return getBusinessAddress().getName();
	}
	
	public void setBusinessName(String businessName) {
		getBusinessAddress().setName(businessName);
	}

	public SellerStatus getSellerStatus() {
		return sellerStatus;
	}

	public void setSellerStatus(SellerStatus sellerStatus) {
		this.sellerStatus = sellerStatus;
	}

	public Region getRegion() {
		return region;
	}

	public void setRegion(Region region) {
		this.region = region;
	}

	public String getWeb() {
		return web;
	}

	public void setWeb(String web) {
		this.web = web;
	}

	public String getSaleType() {
		return saleType;
	}

	public void setSaleType(String saleType) {
		this.saleType = saleType;
	}

	public String getMapUrl() {
		return mapUrl;
	}

	public void setMapUrl(String mapUrl) {
		this.mapUrl = mapUrl;
	}
	
	public Long getAddressId() {
		return getCorrespondenceAddress().getId();
	}
	
	public void setAddressId(Long id) {
		getCorrespondenceAddress().setId(id);
	}

	public CountryState getAddressCountry() {
		return getCorrespondenceAddress().getCountryState();
	}

	public void setAddressCountry(CountryState addressCountry) {
		getCorrespondenceAddress().setCountryState(addressCountry);
	}

	public String getAddressCity() {
		return getCorrespondenceAddress().getCity();
	}

	public void setAddressCity(String addressCity) {
		getCorrespondenceAddress().setCity(addressCity);
	}

	public String getAddressStreet() {
		return getCorrespondenceAddress().getStreet();
	}

	public void setAddressStreet(String addressStreet) {
		getCorrespondenceAddress().setStreet(addressStreet);
	}

	public String getAddressPostCode() {
		return getCorrespondenceAddress().getPostCode();
	}

	public void setAddressPostCode(String addressPostCode) {
		getCorrespondenceAddress().setPostCode(addressPostCode);
	}

	public String getAddressSalutation() {
		return getCorrespondenceAddress().getSalutation();
	}

	public void setAddressSalutation(String addressSalutation) {
		getCorrespondenceAddress().setSalutation(addressSalutation);
	}

	public String getAddressDegree() {
		return getCorrespondenceAddress().getDegree();
	}

	public void setAddressDegree(String addressDegree) {
		getCorrespondenceAddress().setDegree(addressDegree);
	}

	public String getAddressName() {
		return getCorrespondenceAddress().getName();
	}
	
	public void setAddressName(String addressName) {
		getCorrespondenceAddress().setName(addressName);
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public List<SellerPhotoUrl> getSellerPhotoUrls() {
		return sellerPhotoUrls;
	}

	public void setSellerPhotoUrls(List<SellerPhotoUrl> sellerPhotoUrls) {
		this.sellerPhotoUrls = sellerPhotoUrls;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public List<SellerAddress> getAddresses() {
		return addresses;
	}

	public void setAddresses(List<SellerAddress> addresses) {
		this.addresses = addresses;
	}

}