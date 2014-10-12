package cz.kolomet.domain;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

@Entity
public class ApplicationUserPhoto extends BasePhoto implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	public static final String PHOTO_URL_PREFIX = "applicationuser";

	@NotNull
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "APPLICATION_USER_ID")
	private ApplicationUser applicationUser;
	
	@Override
	protected String getPhotoUrlPrefix() {
		return PHOTO_URL_PREFIX;
	}

	@Override
	protected Long getParentContainerId() {
		return getParentContainer().getId();
	}

	@Override
	public PhotoContainer getParentContainer() {
		return applicationUser;
	}

	public ApplicationUser getApplicationUser() {
		return applicationUser;
	}

	public void setApplicationUser(ApplicationUser applicationUser) {
		this.applicationUser = applicationUser;
	}

}
