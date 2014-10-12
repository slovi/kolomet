package cz.kolomet.dto;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import cz.kolomet.domain.codelist.CountryState;
import cz.kolomet.domain.codelist.Region;
import cz.kolomet.domain.codelist.SellerStatus;

public class SellerDto {
	
	private Long id;
	
	private String sellerName;
	
	private String sellerTitle;
	
	private String sellerDescription;
	
	private Boolean enabled;
    
    // zodpovedna osoba
    @Size(max = 20)
    private String personSalutation;
    
    @Size(max = 20)
    private String personDegree;
    
    @Size(max = 20)
    private String personName;
    
    @Size(max = 20)
    private String personSurname;

    private SellerStatus sellerStatus;
    
    private Region region;
    
    @NotNull
    private String web;
    
    @Size(max = 255)
    private String saleType;
    
    @Size(max = 255)
    private String mapUrl;
    
    private CountryState businessCountry;
    
    private String businessCity;
    
    private String businessStreet;
    
    private String businessPostCode;
    
    private String businessSalutation;
    
    private String businessDegree;
    
    private String businessEmail;
    
    private String businessPhoneNumber;

    private String businessName;
    
    private CountryState addressCountry;
    
    private String addressCity;
    
    private String addressStreet;

    private String addressPostCode;
    
    private String addressSalutation;
    
    private String addressDegree;
    
    private String addressEmail;

    private String addressName;
    
    private List<FileInfo> fileInfos = new ArrayList<FileInfo>();

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getSellerName() {
		return sellerName;
	}

	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}

	public String getSellerTitle() {
		return sellerTitle;
	}

	public void setSellerTitle(String sellerTitle) {
		this.sellerTitle = sellerTitle;
	}

	public String getSellerDescription() {
		return sellerDescription;
	}

	public void setSellerDescription(String sellerDescription) {
		this.sellerDescription = sellerDescription;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
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

	public CountryState getBusinessCountry() {
		return businessCountry;
	}

	public void setBusinessCountry(CountryState businessCountry) {
		this.businessCountry = businessCountry;
	}

	public String getBusinessCity() {
		return businessCity;
	}

	public void setBusinessCity(String businessCity) {
		this.businessCity = businessCity;
	}

	public String getBusinessStreet() {
		return businessStreet;
	}

	public void setBusinessStreet(String businessStreet) {
		this.businessStreet = businessStreet;
	}

	public String getBusinessPostCode() {
		return businessPostCode;
	}

	public void setBusinessPostCode(String businessPostCode) {
		this.businessPostCode = businessPostCode;
	}

	public String getBusinessSalutation() {
		return businessSalutation;
	}

	public void setBusinessSalutation(String businessSalutation) {
		this.businessSalutation = businessSalutation;
	}

	public String getBusinessDegree() {
		return businessDegree;
	}

	public void setBusinessDegree(String businessDegree) {
		this.businessDegree = businessDegree;
	}

	public String getBusinessEmail() {
		return businessEmail;
	}

	public void setBusinessEmail(String businessEmail) {
		this.businessEmail = businessEmail;
	}

	public String getBusinessPhoneNumber() {
		return businessPhoneNumber;
	}

	public void setBusinessPhoneNumber(String businessPhoneNumber) {
		this.businessPhoneNumber = businessPhoneNumber;
	}

	public String getBusinessName() {
		return businessName;
	}

	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}

	public CountryState getAddressCountry() {
		return addressCountry;
	}

	public void setAddressCountry(CountryState addressCountry) {
		this.addressCountry = addressCountry;
	}

	public String getAddressCity() {
		return addressCity;
	}

	public void setAddressCity(String addressCity) {
		this.addressCity = addressCity;
	}

	public String getAddressStreet() {
		return addressStreet;
	}

	public void setAddressStreet(String addressStreet) {
		this.addressStreet = addressStreet;
	}

	public String getAddressPostCode() {
		return addressPostCode;
	}

	public void setAddressPostCode(String addressPostCode) {
		this.addressPostCode = addressPostCode;
	}

	public String getAddressSalutation() {
		return addressSalutation;
	}

	public void setAddressSalutation(String addressSalutation) {
		this.addressSalutation = addressSalutation;
	}

	public String getAddressDegree() {
		return addressDegree;
	}

	public void setAddressDegree(String addressDegree) {
		this.addressDegree = addressDegree;
	}

	public String getAddressEmail() {
		return addressEmail;
	}

	public void setAddressEmail(String addressEmail) {
		this.addressEmail = addressEmail;
	}

	public String getAddressName() {
		return addressName;
	}

	public void setAddressName(String addressName) {
		this.addressName = addressName;
	}
	
	public void addFileInfo(FileInfo fileInfo) {
		this.fileInfos.add(fileInfo);
	}
	
	public List<FileInfo> getFileInfos() {
		return fileInfos;
	}

	public void setFileInfos(List<FileInfo> fileInfos) {
		this.fileInfos = fileInfos;
	}

}
