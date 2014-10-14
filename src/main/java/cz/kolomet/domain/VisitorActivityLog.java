package cz.kolomet.domain;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class VisitorActivityLog implements DomainEntity {
	
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
	
	private Date created = new Date();
	
	@ManyToOne(fetch = FetchType.LAZY)
	private Seller seller;
	
	@ManyToOne(fetch = FetchType.LAZY)
	private Product product;
	
	private String ipAddress;
	
	@Enumerated(EnumType.STRING)
	private VisitorActivityType activityType;

	@Override
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Override
	public Integer getVersion() {
		return 0;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}
	
	public Seller getSeller() {
		return seller;
	}

	public void setSeller(Seller seller) {
		this.seller = seller;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	public VisitorActivityType getActivityType() {
		return activityType;
	}

	public void setActivityType(VisitorActivityType activityType) {
		this.activityType = activityType;
	}

	public enum VisitorActivityType {
		SELLER_VISIT, EXTERNAL_SELLER_VISIT, PRODUCT_VISIT, EXTERNAL_PRODUCT_VISIT
	}

}
