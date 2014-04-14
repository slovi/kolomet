// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.domain;

import cz.kolomet.domain.Category;
import cz.kolomet.domain.PhotoUrl;
import cz.kolomet.domain.Producer;
import cz.kolomet.domain.Product;
import cz.kolomet.domain.ProductAttribute;
import cz.kolomet.domain.Seller;
import cz.kolomet.domain.codelist.ProductUsage;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

privileged aspect Product_Roo_JavaBean {
    
    public String Product.getProductName() {
        return this.productName;
    }
    
    public void Product.setProductName(String productName) {
        this.productName = productName;
    }
    
    public BigDecimal Product.getPrice() {
        return this.price;
    }
    
    public void Product.setPrice(BigDecimal price) {
        this.price = price;
    }
    
    public BigDecimal Product.getDiscount() {
        return this.discount;
    }
    
    public void Product.setDiscount(BigDecimal discount) {
        this.discount = discount;
    }
    
    public String Product.getDescription() {
        return this.description;
    }
    
    public void Product.setDescription(String description) {
        this.description = description;
    }
    
    public Seller Product.getSeller() {
        return this.seller;
    }
    
    public void Product.setSeller(Seller seller) {
        this.seller = seller;
    }
    
    public Category Product.getCategory() {
        return this.category;
    }
    
    public void Product.setCategory(Category category) {
        this.category = category;
    }
    
    public Producer Product.getProducer() {
        return this.producer;
    }
    
    public void Product.setProducer(Producer producer) {
        this.producer = producer;
    }
    
    public ProductUsage Product.getProductUsage() {
        return this.productUsage;
    }
    
    public void Product.setProductUsage(ProductUsage productUsage) {
        this.productUsage = productUsage;
    }
    
    public Boolean Product.getEnabled() {
        return this.enabled;
    }
    
    public void Product.setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }
    
    public Date Product.getValidTo() {
        return this.validTo;
    }
    
    public void Product.setValidTo(Date validTo) {
        this.validTo = validTo;
    }
    
    public Boolean Product.getCanSendToAllCountry() {
        return this.canSendToAllCountry;
    }
    
    public void Product.setCanSendToAllCountry(Boolean canSendToAllCountry) {
        this.canSendToAllCountry = canSendToAllCountry;
    }
    
    public Boolean Product.getDeliveryForFree() {
        return this.deliveryForFree;
    }
    
    public void Product.setDeliveryForFree(Boolean deliveryForFree) {
        this.deliveryForFree = deliveryForFree;
    }
    
    public Integer Product.getWeight() {
        return this.weight;
    }
    
    public void Product.setWeight(Integer weight) {
        this.weight = weight;
    }
    
    public List<PhotoUrl> Product.getPhotoUrls() {
        return this.photoUrls;
    }
    
    public void Product.setPhotoUrls(List<PhotoUrl> photoUrls) {
        this.photoUrls = photoUrls;
    }
    
    public List<ProductAttribute> Product.getProductAttributes() {
        return this.productAttributes;
    }
    
    public void Product.setProductAttributes(List<ProductAttribute> productAttributes) {
        this.productAttributes = productAttributes;
    }
    
    public List<CommonsMultipartFile> Product.getContents() {
        return this.contents;
    }
    
    public void Product.setContents(List<CommonsMultipartFile> contents) {
        this.contents = contents;
    }
    
}
