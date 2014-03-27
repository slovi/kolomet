package cz.kolomet.service.impl;

import java.awt.Dimension;
import java.io.File;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import cz.kolomet.domain.PhotoUrl;
import cz.kolomet.domain.SellerPhotoUrl;
import cz.kolomet.service.ImageService;
import cz.kolomet.service.SellerPhotoUrlService;

public class SellerPhotoUrlServiceImpl implements SellerPhotoUrlService {
	
	@Value("${seller.img.width}")
	private Integer width;
	@Value("${seller.img.height}")
	private Integer height;
	
	@Autowired
	private ImageService imageService;
	
	public void saveSellerPhotoUrl(SellerPhotoUrl photoUrl, File file, File targetRootDir) {
		
		sellerPhotoUrlRepository.save(photoUrl);
        
    	// save original image
        String targetFileName = FilenameUtils.getBaseName(file.getName()) + PhotoUrl.ORIGINAL_IMG_SUFFIX;
        imageService.resizeAndSave(file, new File(targetRootDir, targetFileName), new Dimension(width, height));

        FileUtils.deleteQuietly(file);
		
	}
	
}
