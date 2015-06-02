package cz.kolomet.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Cacheable;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.springframework.format.annotation.DateTimeFormat;

import cz.kolomet.domain.codelist.Region;
import cz.kolomet.dto.FileInfo;

@Entity
@Cacheable
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class NewsItem extends BaseDomainEntity implements PhotoContainer, Serializable {
	
	@NotNull
	private Boolean enabled = true;
	
	@NotNull
	private Boolean sendToFacebook = false;
	
	@DateTimeFormat(style="MS")
	private Date newsItemDate = new Date();
	
	@Lob
	@NotNull
	private String text;
	
	private String facebookHeaderText;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "newsItem", cascade = CascadeType.ALL)
    private List<NewsItemPhotoUrl> newsItemPhotoUrls = new ArrayList<NewsItemPhotoUrl>();

	@Enumerated(EnumType.STRING)
	private NewsItemType newsItemType;
	
	private String itemTipLink;
	
	private Long itemTipProductId;
	
	@Transient
	private String accessToken;
	
	@Transient
    private List<FileInfo> fileInfos = new ArrayList<FileInfo>();
	
	@ManyToOne
	private Region region;
	
	private Boolean missingRegion = false;
	
	public NewsItem() {
		
	}
	
	public NewsItem(String text) {
		this.text = text;
	}

	@Override
	public List<? extends Photo> getPhotos() {
		return newsItemPhotoUrls;
	}
	
	@Override
	public String getPhotoType() {
		return NewsItemPhotoUrl.PHOTO_URL_PREFIX;
	}
	
	public String getFacebookText() {
		if (StringUtils.isNotBlank(text)) {
			return text.replaceAll("\\<[^>]*>","");
		} else {
			return text;
		}
	}
	
	public String getContainedImageUrl() {
		
		final String hrefAttributePatternStart = "src=\"";
		final String hrefAttributePatternEnd = "\"";
		
		if (StringUtils.isNotBlank(text)) {
			int hrefIndexStart = text.indexOf(hrefAttributePatternStart);
			if (hrefIndexStart > -1) {
				final String urlSubstring = text.substring(hrefIndexStart + hrefAttributePatternStart.length()); 
				return urlSubstring.substring(0, urlSubstring.indexOf(hrefAttributePatternEnd) - hrefAttributePatternEnd.length() + 1);
			}
		}
		return null;
	}
	
	public String getContainedUrl() {
		
		final String hrefAttributePatternStart = "href=\"";
		final String hrefAttributePatternEnd = "\"";
		
		if (StringUtils.isNotBlank(text)) {
			int hrefIndexStart = text.indexOf(hrefAttributePatternStart);
			if (hrefIndexStart > -1) {
				final String urlSubstring = text.substring(hrefIndexStart + hrefAttributePatternStart.length()); 
				return urlSubstring.substring(0, urlSubstring.indexOf(hrefAttributePatternEnd) - hrefAttributePatternEnd.length() + 1);
			}
		}
		return null;
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

	public Boolean getSendToFacebook() {
		return sendToFacebook;
	}

	public void setSendToFacebook(Boolean sendToFacebook) {
		this.sendToFacebook = sendToFacebook;
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

	public String getFacebookHeaderText() {
		return facebookHeaderText;
	}

	public void setFacebookHeaderText(String facebookHeaderText) {
		this.facebookHeaderText = facebookHeaderText;
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

	public String getAccessToken() {
		return accessToken;
	}

	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}

	public List<FileInfo> getFileInfos() {
		return fileInfos;
	}

	public void setFileInfos(List<FileInfo> fileInfos) {
		this.fileInfos = fileInfos;
	}

	public String getItemTipLink() {
		return itemTipLink;
	}

	public void setItemTipLink(String itemTipLink) {
		this.itemTipLink = itemTipLink;
	}

	public Long getItemTipProductId() {
		return itemTipProductId;
	}

	public void setItemTipProductId(Long itemTipProductId) {
		this.itemTipProductId = itemTipProductId;
	}

	public Region getRegion() {
		return region;
	}

	public void setRegion(Region region) {
		this.region = region;
	}

	public Boolean getMissingRegion() {
		return missingRegion;
	}

	public void setMissingRegion(Boolean missingRegion) {
		this.missingRegion = missingRegion;
	}

}

