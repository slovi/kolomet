package cz.kolomet.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
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

import cz.kolomet.dto.FileInfo;

@Entity
@FilterDef(name = "newsItemEnabledFilter", parameters = @ParamDef(type = "boolean", name = "enabled"))
@Filters({
	@Filter(name = "newsItemEnabledFilter", condition = "enabled = :enabled")
})
public class NewsItem extends BaseDomainEntity implements PhotoContainer, Serializable {
	
	@NotNull
	private Boolean enabled = true;
	
	@DateTimeFormat(style="MS")
	private Date newsItemDate = new Date();
	
	@Lob
	@NotNull
	private String text;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "newsItem", cascade = CascadeType.ALL)
    private List<NewsItemPhotoUrl> newsItemPhotoUrls = new ArrayList<NewsItemPhotoUrl>();

	private NewsItemType newsItemType;
	
	@Transient
    private List<FileInfo> fileInfos = new ArrayList<FileInfo>();

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

	public Boolean getEnabled() {
        return this.enabled;
    }

	public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

	public Date getNewsItemDate() {
        return this.newsItemDate;
    }

	public void setNewsItemDate(Date newsItemDate) {
        this.newsItemDate = newsItemDate;
    }

	public String getText() {
        return this.text;
    }

	public void setText(String text) {
        this.text = text;
    }

	public List<NewsItemPhotoUrl> getNewsItemPhotoUrls() {
        return this.newsItemPhotoUrls;
    }

	public void setNewsItemPhotoUrls(List<NewsItemPhotoUrl> newsItemPhotoUrls) {
        this.newsItemPhotoUrls = newsItemPhotoUrls;
    }
	
	public NewsItemType getNewsItemType() {
        return this.newsItemType;
    }

	public void setNewsItemType(NewsItemType newsItemType) {
        this.newsItemType = newsItemType;
    }

	public List<FileInfo> getFileInfos() {
		return fileInfos;
	}

	public void setFileInfos(List<FileInfo> fileInfos) {
		this.fileInfos = fileInfos;
	}

}

