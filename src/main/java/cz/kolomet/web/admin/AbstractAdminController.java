package cz.kolomet.web.admin;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import cz.kolomet.domain.NewsItem;
import cz.kolomet.domain.NewsItemPhotoUrl;
import cz.kolomet.domain.PhotoUrl;
import cz.kolomet.domain.Product;
import cz.kolomet.domain.Seller;
import cz.kolomet.domain.SellerPhotoUrl;
import cz.kolomet.repository.NewsItemRepository;
import cz.kolomet.security.ApplicationUserDetails;
import cz.kolomet.service.NewsItemPhotoUrlService;
import cz.kolomet.service.PhotoUrlService;
import cz.kolomet.service.SellerPhotoUrlService;
import cz.kolomet.web.AbstractController;

public class AbstractAdminController extends AbstractController {
	
	protected final Log logger = LogFactory.getLog(getClass());
	
	@Value("${img.rootdir}")
	protected String rootDir;
	
	@Autowired
    protected PhotoUrlService photoUrlService;
	
	@Autowired
	protected NewsItemPhotoUrlService newsItemPhotoUrlService;
	
	@Autowired
	protected SellerPhotoUrlService sellerPhotoUrlService;
	
	@Autowired
	private NewsItemRepository newsItemRepository;
	
	@ModelAttribute("newsItems")
	public List<NewsItem> loadNewsItems() {
		return newsItemRepository.findAll();
	}
	
	protected String getUsername() {
		return ApplicationUserDetails.getActualApplicationUserDetails().getUsername();
	}
	
	protected String normalizeDescription(String description) {
		if (StringUtils.isNotEmpty(description)) {
			if (description.charAt(description.length() - 1) == '<') {
				return description.substring(0, description.length() - 2);
			}
		}
		return description;
	}
	
	protected void savePhotos(final Product product, List<CommonsMultipartFile> files) {
		if (files != null) {
			for (final CommonsMultipartFile content: files) {
	        	if (StringUtils.isNotEmpty(content.getOriginalFilename())) {
		        	final File dest = getDestFile(product.getId(), PhotoUrl.PHOTO_URL_PREFIX, content);
		        	try {
		        		logger.info("Saving uploaded file to dest: " + dest);
						content.transferTo(dest);
						logger.info("Successfully save file: " + dest + " " + dest.exists());
					} catch (Exception e) {
						throw new RuntimeException(e);
					}
		        	final PhotoUrl photoUrl = new PhotoUrl();
		        	photoUrl.setFileName(dest.getName());
		        	photoUrl.setContentType(content.getContentType());
		        	photoUrl.setProduct(product);
		        	product.getPhotoUrls().add(photoUrl);
		        	photoUrlService.savePhotoUrl(photoUrl, dest);
	        	}
	        }
		}
	}
	
	protected void saveNewsItemPhotos(final NewsItem newsItem, List<CommonsMultipartFile> files) {
		if (files != null) {
			for (final CommonsMultipartFile content: files) {
	        	if (StringUtils.isNotEmpty(content.getOriginalFilename())) {
		        	final File dest = getDestFile(newsItem.getId(), NewsItemPhotoUrl.PHOTO_URL_PREFIX, content);
		        	try {
						content.transferTo(dest);
					} catch (Exception e) {
						throw new RuntimeException(e);
					}
		        	final NewsItemPhotoUrl newsItemPhotoUrl = new NewsItemPhotoUrl();
		        	newsItemPhotoUrl.setFileName(dest.getName());
		        	newsItemPhotoUrl.setContentType(content.getContentType());
		        	newsItemPhotoUrl.setNewsItem(newsItem);
		        	newsItem.getNewsItemPhotoUrls().add(newsItemPhotoUrl);
		        	newsItemPhotoUrlService.saveNewsItemPhotoUrl(newsItemPhotoUrl, dest);
	        	}
	        }
		}
	}
	
	protected void saveSellerPhotos(final Seller seller, List<CommonsMultipartFile> files) {
		if (files != null) {
			for (final CommonsMultipartFile content: files) {
	        	if (StringUtils.isNotEmpty(content.getOriginalFilename())) {
		        	final File dest = getDestFile(seller.getId(), SellerPhotoUrl.PHOTO_URL_PREFIX, content);
		        	try {
						content.transferTo(dest);
					} catch (Exception e) {
						throw new RuntimeException(e);
					}
		        	final SellerPhotoUrl sellerPhotoUrl = new SellerPhotoUrl();
		        	sellerPhotoUrl.setFileName(dest.getName());
		        	sellerPhotoUrl.setContentType(content.getContentType());
		        	sellerPhotoUrl.setSeller(seller);
		        	seller.getSellerPhotoUrls().add(sellerPhotoUrl);
		        	sellerPhotoUrlService.saveSellerPhotoUrl(sellerPhotoUrl, dest);		        	
	        	}
	        }
		}
	}
	
	protected File getDestFile(Long id, String photoType, CommonsMultipartFile content) {
		File parent = new File(rootDir + "/" + photoType + "/"+ id);
		try {
			FileUtils.forceMkdir(parent);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		File dest = new File(parent, content.getOriginalFilename());
		return dest;
	}

}
