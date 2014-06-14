// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.domain;

import cz.kolomet.domain.Product;
import cz.kolomet.domain.Seller;
import cz.kolomet.domain.SellerPhotoUrl;
import cz.kolomet.domain.codelist.CountryState;
import cz.kolomet.domain.codelist.Region;
import cz.kolomet.domain.codelist.SellerStatus;
import java.util.List;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

privileged aspect Seller_Roo_JavaBean {
    
    public String Seller.getSellerName() {
        return this.sellerName;
    }
    
    public void Seller.setSellerName(String sellerName) {
        this.sellerName = sellerName;
    }
    
    public String Seller.getSellerDescription() {
        return this.sellerDescription;
    }
    
    public void Seller.setSellerDescription(String sellerDescription) {
        this.sellerDescription = sellerDescription;
    }
    
    public String Seller.getSellerTitle() {
        return this.sellerTitle;
    }
    
    public void Seller.setSellerTitle(String sellerTitle) {
        this.sellerTitle = sellerTitle;
    }
    
    public Boolean Seller.getEnabled() {
        return this.enabled;
    }
    
    public void Seller.setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }
    
    public String Seller.getPersonSalutation() {
        return this.personSalutation;
    }
    
    public void Seller.setPersonSalutation(String personSalutation) {
        this.personSalutation = personSalutation;
    }
    
    public String Seller.getPersonDegree() {
        return this.personDegree;
    }
    
    public void Seller.setPersonDegree(String personDegree) {
        this.personDegree = personDegree;
    }
    
    public String Seller.getPersonName() {
        return this.personName;
    }
    
    public void Seller.setPersonName(String personName) {
        this.personName = personName;
    }
    
    public String Seller.getPersonSurname() {
        return this.personSurname;
    }
    
    public void Seller.setPersonSurname(String personSurname) {
        this.personSurname = personSurname;
    }
    
    public CountryState Seller.getBusinessCountry() {
        return this.businessCountry;
    }
    
    public void Seller.setBusinessCountry(CountryState businessCountry) {
        this.businessCountry = businessCountry;
    }
    
    public String Seller.getBusinessCity() {
        return this.businessCity;
    }
    
    public void Seller.setBusinessCity(String businessCity) {
        this.businessCity = businessCity;
    }
    
    public String Seller.getBusinessStreet() {
        return this.businessStreet;
    }
    
    public void Seller.setBusinessStreet(String businessStreet) {
        this.businessStreet = businessStreet;
    }
    
    public String Seller.getBusinessPostCode() {
        return this.businessPostCode;
    }
    
    public void Seller.setBusinessPostCode(String businessPostCode) {
        this.businessPostCode = businessPostCode;
    }
    
    public String Seller.getBusinessSalutation() {
        return this.businessSalutation;
    }
    
    public void Seller.setBusinessSalutation(String businessSalutation) {
        this.businessSalutation = businessSalutation;
    }
    
    public String Seller.getBusinessDegree() {
        return this.businessDegree;
    }
    
    public void Seller.setBusinessDegree(String businessDegree) {
        this.businessDegree = businessDegree;
    }
    
    public String Seller.getBusinessName() {
        return this.businessName;
    }
    
    public void Seller.setBusinessName(String businessName) {
        this.businessName = businessName;
    }
    
    public String Seller.getBusinessEmail() {
        return this.businessEmail;
    }
    
    public void Seller.setBusinessEmail(String businessEmail) {
        this.businessEmail = businessEmail;
    }
    
    public String Seller.getBusinessPhoneNumber() {
        return this.businessPhoneNumber;
    }
    
    public void Seller.setBusinessPhoneNumber(String businessPhoneNumber) {
        this.businessPhoneNumber = businessPhoneNumber;
    }
    
    public SellerStatus Seller.getSellerStatus() {
        return this.sellerStatus;
    }
    
    public void Seller.setSellerStatus(SellerStatus sellerStatus) {
        this.sellerStatus = sellerStatus;
    }
    
    public Region Seller.getRegion() {
        return this.region;
    }
    
    public void Seller.setRegion(Region region) {
        this.region = region;
    }
    
    public String Seller.getWeb() {
        return this.web;
    }
    
    public void Seller.setWeb(String web) {
        this.web = web;
    }
    
    public String Seller.getSaleType() {
        return this.saleType;
    }
    
    public void Seller.setSaleType(String saleType) {
        this.saleType = saleType;
    }
    
    public String Seller.getMapUrl() {
        return this.mapUrl;
    }
    
    public void Seller.setMapUrl(String mapUrl) {
        this.mapUrl = mapUrl;
    }
    
    public CountryState Seller.getAddressCountry() {
        return this.addressCountry;
    }
    
    public void Seller.setAddressCountry(CountryState addressCountry) {
        this.addressCountry = addressCountry;
    }
    
    public String Seller.getAddressCity() {
        return this.addressCity;
    }
    
    public void Seller.setAddressCity(String addressCity) {
        this.addressCity = addressCity;
    }
    
    public String Seller.getAddressStreet() {
        return this.addressStreet;
    }
    
    public void Seller.setAddressStreet(String addressStreet) {
        this.addressStreet = addressStreet;
    }
    
    public String Seller.getAddressPostCode() {
        return this.addressPostCode;
    }
    
    public void Seller.setAddressPostCode(String addressPostCode) {
        this.addressPostCode = addressPostCode;
    }
    
    public String Seller.getAddressSalutation() {
        return this.addressSalutation;
    }
    
    public void Seller.setAddressSalutation(String addressSalutation) {
        this.addressSalutation = addressSalutation;
    }
    
    public String Seller.getAddressDegree() {
        return this.addressDegree;
    }
    
    public void Seller.setAddressDegree(String addressDegree) {
        this.addressDegree = addressDegree;
    }
    
    public String Seller.getAddressName() {
        return this.addressName;
    }
    
    public void Seller.setAddressName(String addressName) {
        this.addressName = addressName;
    }
    
    public String Seller.getAddressEmail() {
        return this.addressEmail;
    }
    
    public void Seller.setAddressEmail(String addressEmail) {
        this.addressEmail = addressEmail;
    }
    
    public List<SellerPhotoUrl> Seller.getSellerPhotoUrls() {
        return this.sellerPhotoUrls;
    }
    
    public void Seller.setSellerPhotoUrls(List<SellerPhotoUrl> sellerPhotoUrls) {
        this.sellerPhotoUrls = sellerPhotoUrls;
    }
    
    public List<Product> Seller.getProducts() {
        return this.products;
    }
    
    public void Seller.setProducts(List<Product> products) {
        this.products = products;
    }
    
    public List<CommonsMultipartFile> Seller.getContents() {
        return this.contents;
    }
    
    public void Seller.setContents(List<CommonsMultipartFile> contents) {
        this.contents = contents;
    }
    
}
