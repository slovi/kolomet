package cz.kolomet.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.task.TaskExecutor;

import cz.kolomet.domain.BasePhoto;
import cz.kolomet.domain.Photo;
import cz.kolomet.domain.PhotoContainerService;
import cz.kolomet.service.ImageService;

public abstract class AbstractPhotoUrlService implements PhotoContainerService {
	
	protected final Log logger = LogFactory.getLog(getClass());
	
	@Value("${img.rootdir}")
	protected String rootDir;
	
	@Autowired
	private ImageService imageService;
	
	@Autowired
	protected TaskExecutor executor;
	
	public abstract ResizeInfo[] getResizeInfos();
	
	@Override
	public void resizePhoto(final File file) {
		
		final List<ResizeInfo> asyncResizeInfos = new ArrayList<AbstractPhotoUrlService.ResizeInfo>();
		
		for (ResizeInfo resizeInfo: getResizeInfos()) {
			
			String targetFileName = BasePhoto.getPhotoUrlFileName(file.getName(), resizeInfo.getSuffix());
			if (!resizeInfo.isAsync()) {
				logger.debug("Try to resize file (" + file.getAbsolutePath() + ") to target file (" + targetFileName + ") in sync mode, calling doResize");
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
						
						String targetFileName = BasePhoto.getPhotoUrlFileName(file.getName(), resizeInfo.getSuffix());
						logger.debug("Try to resize file (" + file.getAbsolutePath() + ") to target file (" + targetFileName + ") in async mode, calling doResize");
						doResize(file, resizeInfo, targetFileName);
					}
					deleteAfterImageProcess(file);
				}

			});
		} else {
			deleteAfterImageProcess(file);
		}
	}

	private void doResize(final File file, ResizeInfo resizeInfo, String targetFileName) {
		if (resizeInfo.resizeImage()) {
			imageService.resizeAndSave(file, new File(file.getParent(), targetFileName), resizeInfo.getDimension());
		} else {
			imageService.save(file, new File(file.getParent(), targetFileName));
		}
	}
	
	@Override
	public void deletePhoto(Photo photo) {
		if (photo.getPhotoUrl() != null) {
			deleteFile(new File(rootDir + "/" + photo.getPhotoUrl()));
		}
		if (photo.getOverPhotoUrl() != null) {
			deleteFile(new File(rootDir + "/" + photo.getOverPhotoUrl()));
		}
		if (photo.getThumbPhotoUrl() != null) {
			deleteFile(new File(rootDir + "/" + photo.getThumbPhotoUrl()));
		}
	}

	private void deleteAfterImageProcess(final File file) {
		logger.debug("Try to delete file: " + file.getAbsolutePath() + "after image resize process");
		deleteFile(file);
	}
	
	private void deleteFile(final File file) {
		if (!FileUtils.deleteQuietly(file)) {
			logger.warn("Cannot delete uploaded file " + file.getAbsolutePath());
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

}
