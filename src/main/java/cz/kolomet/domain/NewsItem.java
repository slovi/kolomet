package cz.kolomet.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.FetchType;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.Filter;
import org.hibernate.annotations.FilterDef;
import org.hibernate.annotations.Filters;
import org.hibernate.annotations.ParamDef;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.equals.RooEquals;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@RooJavaBean
@RooToString(excludeFields = {"createdBy", "lastModifiedBy", "createdDate", "lastModifiedDate"})
@RooJpaEntity(inheritanceType = "TABLE_PER_CLASS")
@RooEquals(excludeFields = {"createdBy", "lastModifiedBy", "createdDate", "lastModifiedDate"})
@RooSerializable
@FilterDef(name = "newsItemEnabledFilter", parameters = @ParamDef(type = "boolean", name = "enabled"))
@Filters({
	@Filter(name = "newsItemEnabledFilter", condition = "enabled = :enabled")
})
public class NewsItem extends DomainEntity implements PhotoContainer {
	
	@NotNull
	private Boolean enabled = true;
	
	@DateTimeFormat(style="MS")
	private Date newsItemDate = new Date();
	
	@Lob
	@NotNull
	private String text;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "newsItem", cascade = CascadeType.ALL)
    private List<NewsItemPhotoUrl> newsItemPhotoUrls = new ArrayList<NewsItemPhotoUrl>();

	@Transient
    private List<CommonsMultipartFile> contents;
	
	private NewsItemType newsItemType;

	@Override
	public List<? extends Photo> getPhotos() {
		return newsItemPhotoUrls;
	}
	
	@Override
	public String getPhotoType() {
		return NewsItemPhotoUrl.PHOTO_URL_PREFIX;
	}

	@Override
	public Photo addPhoto(String fileName, String contentType) {
		final NewsItemPhotoUrl newsItemPhotoUrl = new NewsItemPhotoUrl();
		newsItemPhotoUrl.setFileName(fileName);
		newsItemPhotoUrl.setContentType(contentType);
		newsItemPhotoUrl.setNewsItem(this);
		this.getNewsItemPhotoUrls().add(newsItemPhotoUrl);
		return newsItemPhotoUrl;
	}
	
}

