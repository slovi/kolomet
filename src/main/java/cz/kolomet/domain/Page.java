package cz.kolomet.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

import cz.kolomet.dto.FileInfo;

@Entity
public class Page extends BaseDomainEntity implements PhotoContainer, Serializable {
	
	private String name;
	
	private Integer width = 678;
	
	private String text;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "page", cascade = CascadeType.ALL)
    private List<PagePhotoUrl> pagePhotoUrls = new ArrayList<PagePhotoUrl>();
	
	@Transient
    private List<FileInfo> fileInfos = new ArrayList<FileInfo>();

	@Override
	public List<? extends Photo> getPhotos() {
		return pagePhotoUrls;
	}
	
	@Override
	public String getPhotoType() {
		return PagePhotoUrl.PHOTO_URL_PREFIX;
	}

	@Override
	public Photo addPhoto(String fileName, String contentType) {
		final PagePhotoUrl pagePhotoUrl = new PagePhotoUrl();
		pagePhotoUrl.setFileName(fileName);
		pagePhotoUrl.setContentType(contentType);
		pagePhotoUrl.setPage(this);
		this.getPagePhotoUrls().add(pagePhotoUrl);
		return pagePhotoUrl;
	}
	
	public List<PagePhotoUrl> getPagePhotoUrls() {
		return pagePhotoUrls;
	}

	public void setPagePhotoUrls(List<PagePhotoUrl> pagePhotoUrls) {
		this.pagePhotoUrls = pagePhotoUrls;
	}

	public List<FileInfo> getFileInfos() {
		return fileInfos;
	}

	public void setFileInfos(List<FileInfo> fileInfos) {
		this.fileInfos = fileInfos;
	}

	public Integer getWidth() {
		return width;
	}

	public void setWidth(Integer width) {
		this.width = width;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

}
