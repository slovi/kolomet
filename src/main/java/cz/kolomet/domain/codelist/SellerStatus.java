package cz.kolomet.domain.codelist;

import java.io.Serializable;

import javax.persistence.Entity;

@Entitypublic class SellerStatus extends Codelist implements Serializable {
	
	private static final String SELLER_STATUS_VIP = "sellst_vip";
	
	private Integer priority;
	
	public boolean isVip() {
		return this.getCodeKey().equals(SELLER_STATUS_VIP);
	}

	public Integer getPriority() {
        return this.priority;
    }

	public void setPriority(Integer priority) {
        this.priority = priority;
    }

}
