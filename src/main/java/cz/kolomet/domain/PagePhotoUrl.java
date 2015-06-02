package cz.kolomet.domain;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Entity
public class PagePhotoUrl extends BasePhoto {
	
	public static final String PHOTO_URL_PREFIX = "photo";
    
    @NotNull
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "PAGE_ID")
    private Page page;
    
    @Transient
    private List<CommonsMultipartFile> contents;
    
    @Override
    protected String getPhotoUrlPrefix() {
    	return PHOTO_URL_PREFIX;
    }
    
    @Override
    protected Long getParentContainerId() {
    	return page.getId();
    }
    
	@Override
	public PhotoContainer getParentContainer() {
		return page;
	}

	@Override
	public String getThumbPhotoUrl() {
		return null;
	}

	@Override
	public String getOverPhotoUrl() {
		return null;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public List<CommonsMultipartFile> getContents() {
		return contents;
	}

	public void setContents(List<CommonsMultipartFile> contents) {
		this.contents = contents;
	}

}
