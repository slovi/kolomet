package cz.kolomet.domain;
import javax.persistence.Cacheable;
import javax.persistence.Entity;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import cz.kolomet.domain.codelist.Codelist;

@Entity
@Cacheable
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class Producer extends Codelist {

}
