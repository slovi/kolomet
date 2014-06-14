package cz.kolomet.service.impl;

import java.io.File;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.task.TaskExecutor;

import cz.kolomet.domain.NewsItemPhotoUrl;
import cz.kolomet.domain.PhotoUrl;
import cz.kolomet.service.ImageService;
import cz.kolomet.service.NewsItemPhotoUrlService;

public class NewsItemPhotoUrlServiceImpl implements NewsItemPhotoUrlService {
	
	@Autowired
	private ImageService imageService;
	
	@Autowired
	private TaskExecutor executor;
	
	@Value("${img.rootdir}")
	protected String rootDir;
    
    public void deleteNewsItemPhotoUrl(NewsItemPhotoUrl newsItemPhotoUrl) {
        newsItemPhotoUrlRepository.delete(newsItemPhotoUrl);
        
        FileUtils.deleteQuietly(new File(rootDir + "/" + newsItemPhotoUrl.getPhotoUrl()));
    }
	
	public void saveNewsItemPhotoUrl(NewsItemPhotoUrl photoUrl, final File file) {
		
		newsItemPhotoUrlRepository.save(photoUrl);
		
    	executor.execute(new Runnable() {
			
			@Override
			public void run() {
				
				// save original image
				String targetFileName = FilenameUtils.getBaseName(file.getName()) + PhotoUrl.ORIGINAL_IMG_SUFFIX;
				imageService.save(file, new File(file.getParent(), targetFileName));
				
				FileUtils.deleteQuietly(file);
			}
		});
	}
	
}
