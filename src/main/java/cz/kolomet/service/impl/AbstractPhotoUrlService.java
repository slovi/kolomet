package cz.kolomet.service.impl;

import java.awt.Dimension;
import java.io.File;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.task.TaskExecutor;

import cz.kolomet.domain.Photo;
import cz.kolomet.domain.PhotoContainerService;
import cz.kolomet.service.ImageService;

public abstract class AbstractPhotoUrlService implements PhotoContainerService {
	
	@Value("${img.rootdir}")
	protected String rootDir;
	
	@Autowired
	private ImageService imageService;
	
	@Autowired
	protected TaskExecutor executor;
	
	protected abstract ResizeInfo[] getResizeInfos();
	
	@Override
	public void resizePhoto(final File photo) {
		executor.execute(new Runnable() {
			
			@Override
			public void run() {
				resizePhoto(photo, getResizeInfos(), true);
			}
		});
	}
	
	protected void resizePhoto(File file, ResizeInfo[] resizeInfos, boolean deleteAfterResize) {
		
		for (ResizeInfo resizeInfo: resizeInfos) {
			
			String targetFileName = FilenameUtils.getBaseName(file.getName()) + resizeInfo.getSuffix();
			if (resizeInfo.resizeImage()) {
				imageService.resizeAndSave(file, new File(file.getParent(), targetFileName), resizeInfo.getDimension());
			} else {
				imageService.save(file, new File(file.getParent(), targetFileName));
			}
		}
		
		if (deleteAfterResize) {
			FileUtils.deleteQuietly(file);
		}
	}
	
	protected void deletePhoto(Photo photo) {
		if (photo.getPhotoUrl() != null) {
			FileUtils.deleteQuietly(new File(rootDir + "/" + photo.getPhotoUrl()));
		}
		if (photo.getOverPhotoUrl() != null) {
			FileUtils.deleteQuietly(new File(rootDir + "/" + photo.getOverPhotoUrl()));
		}
		if (photo.getThumbPhotoUrl() != null) {
			FileUtils.deleteQuietly(new File(rootDir + "/" + photo.getThumbPhotoUrl()));
		}
	}
	
	class ResizeInfo {
		
		private final Dimension dimension;
		private final String suffix;
		
		public ResizeInfo(String suffix) {
			this(null, suffix);
		}
		
		public ResizeInfo(Dimension dimension, String suffix) {
			this.dimension = dimension;
			this.suffix = suffix;
		}
		
		public boolean resizeImage() {
			return dimension != null;
		}
		
		public Dimension getDimension() {
			return dimension;
		}

		public String getSuffix() {
			return suffix;
		}
	}

}
