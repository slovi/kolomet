// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.service.impl;

import cz.kolomet.domain.Product;
import cz.kolomet.repository.ProductRepository;
import cz.kolomet.service.impl.ProductServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ProductServiceImpl_Roo_Service {
    
    declare @type: ProductServiceImpl: @Service;
    
    declare @type: ProductServiceImpl: @Transactional;
    
    @Autowired
    ProductRepository ProductServiceImpl.productRepository;
    
    public long ProductServiceImpl.countAllProducts() {
        return productRepository.count();
    }
    
    public List<Product> ProductServiceImpl.findAllProducts() {
        return productRepository.findAll();
    }
    
    public List<Product> ProductServiceImpl.findProductEntries(int firstResult, int maxResults) {
        return productRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
}
