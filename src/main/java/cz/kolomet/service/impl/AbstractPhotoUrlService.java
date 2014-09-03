package cz.kolomet.service.impl;

import java.awt.Dimension;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.task.TaskExecutor;

import cz.kolomet.domain.BasePhotoUrl;
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
	public void resizePhoto(final File file) {
		
		final List<ResizeInfo> asyncResizeInfos = new ArrayList<AbstractPhotoUrlService.ResizeInfo>();
		
		for (ResizeInfo resizeInfo: getResizeInfos()) {
			
			String targetFileName = BasePhotoUrl.getPhotoUrlFileName(file.getName(), resizeInfo.getSuffix());
			if (!resizeInfo.isAsync()) {
				doResize(file, resizeInfo, targetFileName);
			} else {
				asyncResizeInfos.add(resizeInfo);
			}
		}
		
		if (!asyncResizeInfos.isEmpty()) {
		
			executor.execute(new Runnable() {
				
				@Override
				public void run() {
					
					for (ResizeInfo resizeInfo: asyncResizeInfos) {
						
						String targetFileName = BasePhotoUrl.getPhotoUrlFileName(file.getName(), resizeInfo.getSuffix());
						doResize(file, resizeInfo, targetFileName);
					}
					
					FileUtils.deleteQuietly(file);
					
				}
			});
		} else {
			FileUtils.deleteQuietly(file);
		}
	}

	private void doResize(final File file, ResizeInfo resizeInfo, String targetFileName) {
		if (resizeInfo.resizeImage()) {
			imageService.resizeAndSave(file, new File(file.getParent(), targetFileName), resizeInfo.getDimension());
		} else {
			imageService.save(file, new File(file.getParent(), targetFileName));
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
	
	public String getRootDir() {
		return rootDir;
	}

	public void setRootDir(String rootDir) {
		this.rootDir = rootDir;
	}

	public ImageService getImageService() {
		return imageService;
	}

	public void setImageService(ImageService imageService) {
		this.imageService = imageService;
	}

	public TaskExecutor getExecutor() {
		return executor;
	}

	public void setExecutor(TaskExecutor executor) {
		this.executor = executor;
	}

	class ResizeInfo {
		
		private final Dimension dimension;
		private final String suffix;
		private final boolean async;
		
		public ResizeInfo(String suffix) {
			this(null, suffix, false);
		}
		
		public ResizeInfo(Dimension dimension, String suffix) {
			this(null, suffix, true);
		}
		
		public ResizeInfo(Dimension dimension, String suffix, boolean async) {
			this.dimension = dimension;
			this.suffix = suffix;
			this.async = async;
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

		public boolean isAsync() {
			return async;
		}
	}

}
