package cz.kolomet.domain.codelist;

import java.io.Serializable;

import javax.persistence.Cacheable;
import javax.persistence.Embedded;
import javax.persistence.Entity;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import cz.kolomet.domain.GpsLocation;

@Entity
@Cacheable
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)public class Region extends Codelist implements Serializable {
	
	@Embedded
	private GpsLocation gpsLocation;
	
	private String googleAlias;
	
	private String googleAliasEn;
	
	private Integer zoom;

	public Integer getZoom() {
		return zoom;
	}

	public void setZoom(Integer zoom) {
		this.zoom = zoom;
	}

	public GpsLocation getGpsLocation() {
        return this.gpsLocation;
    }

	public void setGpsLocation(GpsLocation gpsLocation) {
        this.gpsLocation = gpsLocation;
    }

	public String getGoogleAlias() {
        return this.googleAlias;
    }

	public void setGoogleAlias(String googleAlias) {
        this.googleAlias = googleAlias;
    }

	public String getGoogleAliasEn() {
		return googleAliasEn;
	}

	public void setGoogleAliasEn(String googleAliasEn) {
		this.googleAliasEn = googleAliasEn;
	}

	public String toString() {
        return new ReflectionToStringBuilder(this, ToStringStyle.SHORT_PREFIX_STYLE).setExcludeFieldNames("createdBy", "lastModifiedBy", "createdDate", "lastModifiedDate").toString();
    }
}
