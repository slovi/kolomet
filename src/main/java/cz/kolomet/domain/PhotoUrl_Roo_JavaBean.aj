// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.domain;

import cz.kolomet.domain.PhotoUrl;
import cz.kolomet.domain.Product;
import java.util.List;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

privileged aspect PhotoUrl_Roo_JavaBean {
    
    public Product PhotoUrl.getProduct() {
        return this.product;
    }
    
    public void PhotoUrl.setProduct(Product product) {
        this.product = product;
    }
    
    public List<CommonsMultipartFile> PhotoUrl.getContents() {
        return this.contents;
    }
    
    public void PhotoUrl.setContents(List<CommonsMultipartFile> contents) {
        this.contents = contents;
    }
    
}
