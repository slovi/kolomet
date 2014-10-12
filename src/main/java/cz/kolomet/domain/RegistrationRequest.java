package cz.kolomet.domain;

import java.io.IOException;
import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import org.apache.commons.io.FileUtils;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import cz.kolomet.service.exception.DefaultObjectDataReadException;

@Entity
public class RegistrationRequest extends BaseDomainEntity implements Serializable {
	
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

	public String getEmail() {
        return this.email;
    }

	public void setEmail(String email) {
        this.email = email;
    }

	public String getPhone() {
        return this.phone;
    }

	public void setPhone(String phone) {
        this.phone = phone;
    }

	public String getText() {
        return this.text;
    }

	public void setText(String text) {
        this.text = text;
    }

	public Boolean getProcessed() {
        return this.processed;
    }

	public void setProcessed(Boolean processed) {
        this.processed = processed;
    }

	public String getCaptchaText() {
        return this.captchaText;
    }

	public void setCaptchaText(String captchaText) {
        this.captchaText = captchaText;
    }

}
