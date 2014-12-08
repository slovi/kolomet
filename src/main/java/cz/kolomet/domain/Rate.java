package cz.kolomet.domain;
import java.io.Serializable;

import javax.persistence.Entity;

@Entity
public class Rate extends BaseDomainEntity implements Serializable {

    private RateType rateType;
    
    private Long entityId;

    private String ipAddress;
    
    private Integer value;

	public RateType getRateType() {
        return this.rateType;
    }

	public void setRateType(RateType rateType) {
        this.rateType = rateType;
    }

	public Long getEntityId() {
        return this.entityId;
    }

	public void setEntityId(Long entityId) {
        this.entityId = entityId;
    }

	public String getIpAddress() {
        return this.ipAddress;
    }

	public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress;
    }

	public Integer getValue() {
        return this.value;
    }

	public void setValue(Integer value) {
        this.value = value;
    }
}
