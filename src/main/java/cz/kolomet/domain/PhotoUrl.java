package cz.kolomet.domain;
import org.springframework.roo.addon.equals.RooEquals;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@RooJavaBean
@RooToString
@RooJpaEntity(inheritanceType = "TABLE_PER_CLASS")
@RooEquals
@RooSerializable
public class PhotoUrl extends DomainEntity {

    /**
     */
    @NotNull
    @Size(max = 20)
    private String urlValue;
}
