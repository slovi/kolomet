package cz.kolomet.domain;

import java.io.IOException;

import javax.persistence.Column;
import javax.validation.constraints.NotNull;

import org.apache.commons.io.FileUtils;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.roo.addon.equals.RooEquals;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;

import cz.kolomet.service.exception.DefaultObjectDataReadException;

@RooJavaBean
@RooToString
@RooJpaEntity(inheritanceType = "TABLE_PER_CLASS")
@RooEquals
@RooSerializable
public class RegistrationRequest extends DomainEntity {
	
	@NotNull
	private String email;
	
	@NotNull
	private String phone;
	
	private String text;
	
	private Boolean processed = false;
	
	@Column(insertable = false, updatable = false)
	private String captchaText;
	
	public void setDefaultText() throws DefaultObjectDataReadException {
		Resource resource = new ClassPathResource("RegistrationRequest.text.default", getClass());
		try {
			this.text = FileUtils.readFileToString(resource.getFile());
		} catch (IOException e) {
			throw new DefaultObjectDataReadException(this, "text.default", e);
		}
	}
	
}
