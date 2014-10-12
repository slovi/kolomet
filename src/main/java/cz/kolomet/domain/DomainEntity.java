package cz.kolomet.domain;

import org.springframework.data.domain.Auditable;

public interface DomainEntity extends Auditable<ApplicationUser, Long>{
    
	public Long getId();

	public Integer getVersion();

	public void setVersion(Integer version);

}
