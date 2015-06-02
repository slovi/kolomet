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
@BatchSize(size = 20)
public class Seller extends BaseDomainEntity implements PhotoContainer, Serializable, SimpleNameIdentifiable {
	
	@NotNull
	@Size(max = 20)
	private String sellerName;
	
	private String simplifiedName;

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
    @BatchSize(size = 20)
    private List<SellerPhotoUrl> sellerPhotoUrls = new ArrayList<SellerPhotoUrl>();
    
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "seller", cascade = CascadeType.ALL)
    private List<Product> products = new ArrayList<Product>();
    
    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "APPLICATION_USER_ID")
	@Fetch(FetchMode.JOIN)
    @BatchSize(size = 20)
	private List<SellerAddress> addresses = new ArrayList<SellerAddress>();
    
    public void simplifyName() {
    	if (StringUtils.isBlank(this.simplifiedName)) {
    		this.simplifiedName = cz.kolomet.util.StringUtils.simplify(this.getSellerName() + "__" + this.getId());
    	}
    }
    
    public void simplifyNameAnyway() {
    	this.simplifiedName = cz.kolomet.util.StringUtils.simplify(this.getSellerName() + "__" + this.getId());
    }
    
    public boolean isVip() {
    	return this.sellerStatus != null && this.sellerStatus.isVip();
    }
    
    @Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((getSellerName() == null) ? 0 : getSellerName().hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (!(obj instanceof Seller))
			return false;
		Seller other = (Seller) obj;
		if (getSellerName() == null) {
			if (other.getSellerName() != null)
				return false;
		} else if (!getSellerName().equals(other.getSellerName()))
			return false;
		return true;
	}

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
    	return getCorrespondenceAddressNullSafe().getAddressString();
    }
    
    public String getBusinessAddressString() {
    	return getBusinessAddressNullSafe().getAddressString();
    }
    
    public String getContactString() {
    	return getBusinessAddressNullSafe().getContactString();
    }
    
    public void normalizeWebUrl() {
    	if (StringUtils.isNotEmpty(web) && !web.startsWith("http://") && !web.startsWith("https://")) {
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
    	return getAddressByType(AddressType.CORRESPONDENCE);
    }
    
    public SellerAddress getBusinessAddress() {
    	return getAddressByType(AddressType.BUSINNES_PLACE);
    }

    private SellerAddress getCorrespondenceAddressNullSafe() {
    	return getAddressByTypeNullSafe(AddressType.CORRESPONDENCE);
    }
    
    private SellerAddress getBusinessAddressNullSafe() {
    	return getAddressByTypeNullSafe(AddressType.BUSINNES_PLACE);
    }
	
	public String getSellerName() {
		return sellerName;
	}

	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}

	public String getSimplifiedName() {
		this.simplifyName(); // TODO temp
		return simplifiedName;
	}

	public void setSimplifiedName(String simplifiedName) {
		this.simplifiedName = simplifiedName;
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
		return getBusinessAddressNullSafe().getId();
	}
	
	public CountryState getBusinessCountry() {
		return getBusinessAddressNullSafe().getCountryState();
	}

	public String getBusinessCity() {
		return getBusinessAddressNullSafe().getCity();
	}

	public String getBusinessStreet() {
		return getBusinessAddressNullSafe().getStreet();
	}

	public String getBusinessPostCode() {
		return getBusinessAddressNullSafe().getPostCode();
	}

	public String getBusinessSalutation() {
		return getBusinessAddressNullSafe().getSalutation();
	}

	public String getBusinessDegree() {
		return getBusinessAddressNullSafe().getDegree();
	}

	public String getBusinessEmail() {
		return getBusinessAddressNullSafe().getEmail();
	}

	public String getBusinessPhoneNumber() {
		return getBusinessAddressNullSafe().getPhoneNumber();
	}
	
	public String getBusinessName() {
		return getBusinessAddressNullSafe().getName();
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
		return getCorrespondenceAddressNullSafe().getId();
	}
	
	public CountryState getAddressCountry() {
		return getCorrespondenceAddressNullSafe().getCountryState();
	}

	public String getAddressCity() {
		return getCorrespondenceAddressNullSafe().getCity();
	}

	public String getAddressStreet() {
		return getCorrespondenceAddressNullSafe().getStreet();
	}

	public String getAddressPostCode() {
		return getCorrespondenceAddressNullSafe().getPostCode();
	}

	public String getAddressSalutation() {
		return getCorrespondenceAddressNullSafe().getSalutation();
	}

	public String getAddressDegree() {
		return getCorrespondenceAddressNullSafe().getDegree();
	}

	public String getAddressName() {
		return getCorrespondenceAddressNullSafe().getName();
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