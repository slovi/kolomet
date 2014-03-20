// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.domain;

import cz.kolomet.domain.PhotoUrl;
import cz.kolomet.domain.Product;
import cz.kolomet.domain.ProductAttribute;
import cz.kolomet.domain.Seller;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

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
    
    public Boolean Product.getActive() {
        return this.active;
    }
    
    public void Product.setActive(Boolean active) {
        this.active = active;
    }
    
    public Date Product.getValidTo() {
        return this.validTo;
    }
    
    public void Product.setValidTo(Date validTo) {
        this.validTo = validTo;
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
    
}
