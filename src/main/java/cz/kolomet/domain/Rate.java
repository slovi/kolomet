package cz.kolomet.domain;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.persistence.Entity;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;

@Entity
public class Rate extends BaseDomainEntity implements Serializable {

    private RateType rateType;
    
    private Long entityId;

    private String ipAddress;
    
    private Integer value;

	public String toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }

	public static Rate fromJsonToRate(String json) {
        return new JSONDeserializer<Rate>().use(null, Rate.class).deserialize(json);
    }

	public static String toJsonArray(Collection<Rate> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }

	public static Collection<Rate> fromJsonArrayToRates(String json) {
        return new JSONDeserializer<List<Rate>>().use(null, ArrayList.class).use("values", Rate.class).deserialize(json);
    }

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
