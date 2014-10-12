package cz.kolomet.domain.codelist;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
@Entity
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)public class FigureHeight extends Codelist implements Serializable {

}
