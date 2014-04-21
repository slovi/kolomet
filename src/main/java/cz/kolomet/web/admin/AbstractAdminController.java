package cz.kolomet.web.admin;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import cz.kolomet.domain.NewsItem;
import cz.kolomet.domain.NewsItemPhotoUrl;
import cz.kolomet.domain.PhotoUrl;
import cz.kolomet.domain.Product;
import cz.kolomet.repository.NewsItemRepository;
import cz.kolomet.security.ApplicationUserDetails;
import cz.kolomet.service.NewsItemPhotoUrlService;
import cz.kolomet.service.PhotoUrlService;

public class AbstractAdminController {
	
	@Value("${product.img.rootdir}")
	protected String rootDir;
	
	@Autowired
    protected PhotoUrlService photoUrlService;
	
	@Autowired
	protected NewsItemPhotoUrlService newsItemPhotoUrlService;
	
	@Autowired
	private NewsItemRepository newsItemRepository;
	
	@ModelAttribute("newsItems")
	public List<NewsItem> loadNewsItems() {
		return newsItemRepository.findAll();
	}
	
	protected String getUsername() {
		return ApplicationUserDetails.getActualApplicationUserDetails().getUsername();
	}
	
	protected void savePhotos(Product product, List<CommonsMultipartFile> files) {
		if (files != null) {
			for (CommonsMultipartFile content: files) {
	        	if (StringUtils.isNotEmpty(content.getOriginalFilename())) {
		        	File dest = getDestFile(product.getId(), content);
		        	try {
						content.transferTo(dest);
					} catch (Exception e) {
						throw new RuntimeException(e);
					}
		        	PhotoUrl photoUrl = new PhotoUrl();
		        	photoUrl.setFileName(dest.getName());
					photoUrl.setContentType(content.getContentType());
					photoUrl.setProduct(product);
		        	photoUrlService.savePhotoUrl(photoUrl, dest);
	        	}
	        }
		}
	}
	
	protected void saveNewsItemPhotos(NewsItem newsItem, List<CommonsMultipartFile> files) {
		if (files != null) {
			for (CommonsMultipartFile content: files) {
	        	if (StringUtils.isNotEmpty(content.getOriginalFilename())) {
		        	File dest = getDestFile(newsItem.getId(), content);
		        	try {
						content.transferTo(dest);
					} catch (Exception e) {
						throw new RuntimeException(e);
					}
		        	NewsItemPhotoUrl photoUrl = new NewsItemPhotoUrl();
		        	photoUrl.setFileName(dest.getName());
					photoUrl.setContentType(content.getContentType());
					photoUrl.setNewsItem(newsItem);
		        	newsItemPhotoUrlService.saveNewsItemPhotoUrl(photoUrl, dest);
	        	}
	        }
		}
	}
	
	protected File getDestFile(Long id, CommonsMultipartFile content) {
		File parent = new File(rootDir + "/" + id);
		try {
			FileUtils.forceMkdir(parent);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		File dest = new File(parent, content.getOriginalFilename());
		return dest;
	}

}
