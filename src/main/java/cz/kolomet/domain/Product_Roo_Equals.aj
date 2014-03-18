// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.domain;

import cz.kolomet.domain.Product;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

privileged aspect Product_Roo_Equals {
    
    public boolean Product.equals(Object obj) {
        if (!(obj instanceof Product)) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        Product rhs = (Product) obj;
        return new EqualsBuilder().append(category, rhs.category).append(description, rhs.description).append(discount, rhs.discount).append(id, rhs.id).append(price, rhs.price).append(producer, rhs.producer).append(productName, rhs.productName).append(seller, rhs.seller).isEquals();
    }
    
    public int Product.hashCode() {
        return new HashCodeBuilder().append(category).append(description).append(discount).append(id).append(price).append(producer).append(productName).append(seller).toHashCode();
    }
    
}
