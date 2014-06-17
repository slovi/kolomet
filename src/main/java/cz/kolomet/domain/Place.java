package cz.kolomet.domain;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Embedded;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.springframework.roo.addon.equals.RooEquals;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;

import cz.kolomet.domain.codelist.PlaceType;

@RooJavaBean
@RooToString
@RooJpaEntity(inheritanceType = "TABLE_PER_CLASS")
@RooEquals
@RooSerializable
public class Place extends DomainEntity implements Commented {
	
	@NotNull
	private String name;

	private String description;
	
	@NotNull
	@ManyToOne
	private PlaceType placeType;
	
	@Embedded
	private Address address;
	
	@Embedded
	private GpsLocation gpsLocation;
	
	private Integer bikeRoadNr;
	
	private Integer qualityRanking;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "commented")
	private List<ProductComment> comments;
	
}
