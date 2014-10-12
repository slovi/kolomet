package cz.kolomet.domain;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Entity
public class NewsItemPhotoUrl extends BasePhoto implements Serializable {
	
	public static final String PHOTO_URL_PREFIX = "newsitem";
    
    @NotNull
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "NEWSITEM_ID")
    private NewsItem newsItem;
    
    @Transient
    private List<CommonsMultipartFile> contents;
    
    @Override
    protected String getPhotoUrlPrefix() {
    	return PHOTO_URL_PREFIX;
    }
    
    @Override
    protected Long getParentContainerId() {
    	return newsItem.getId();
    }
    
	@Override
	public PhotoContainer getParentContainer() {
		return newsItem;
	}

	@Override
	public String getThumbPhotoUrl() {
		return null;
	}

	@Override
	public String getOverPhotoUrl() {
		return null;
	}

	public NewsItem getNewsItem() {
        return this.newsItem;
    }

	public void setNewsItem(NewsItem newsItem) {
        this.newsItem = newsItem;
    }

	public List<CommonsMultipartFile> getContents() {
        return this.contents;
    }

	public void setContents(List<CommonsMultipartFile> contents) {
        this.contents = contents;
    }
}
