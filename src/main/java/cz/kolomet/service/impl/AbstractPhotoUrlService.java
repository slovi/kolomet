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
	
	public abstract ResizeInfo[] getThumbnailResizeInfos();
	
	public abstract ResizeInfo[] getResizeInfos();
	
	@Override
	public void createThumbnail(final File photo) {
		resizePhoto(photo, getThumbnailResizeInfos(), 
			
			new AfterResizeCallback() {
				@Override
				public void afterResize(File file) {
				}
			},
			
			new AfterResizeCallback() {
				@Override
				public void afterResize(File file) {
				}
			});
	}
	
	@Override
	public void createImages(final File photo, final File targetFolder) {
		
		// v dobe vytvareni thumb neni jeste zrejma slozka, do ktere by se mel obrazek presunout, prvni chvile, kdy je mozne 
		// tak ucinit je nyni.
		for (ResizeInfo resizeInfo: getThumbnailResizeInfos()) {
			File thumbnailSource = new File(photo.getParent(), BasePhoto.getPhotoUrlFileName(photo.getName(), resizeInfo.getSuffix()));
			File thumbnailTarget = new File(targetFolder, BasePhoto.getPhotoUrlFileName(photo.getName(), resizeInfo.getSuffix()));
			moveFile(thumbnailSource, thumbnailTarget, true);
		}
		
		resizePhoto(photo, getResizeInfos(), 
			
			// zavola se po kazdem zmenseni obrazku a vstupem je zmenseny file
			new AfterResizeCallback() {
				
				@Override
				public void afterResize(File file) {
					moveFile(file, new File(targetFolder, file.getName()), true);
				}
			},
				
			// zavola se po zmenseni vsech obrazku a vstupem je zdrojovy file
			new AfterResizeCallback() {
				
				@Override
				public void afterResize(File file) {
					deleteAfterImageProcess(file);
				}
			});
	}
	
	@Override
	public void copyImages(File sourceFolder, File targetFolder) {
		for (File sourceFile: sourceFolder.listFiles()) {
			moveFile(sourceFile, new File(targetFolder, sourceFile.getName()), true);
		}
	}
	
	private void resizePhoto(final File file, final ResizeInfo[] resizeInfos, final AfterResizeCallback targetFileCallback, final AfterResizeCallback sourceFileCallback) {
		
		final List<ResizeInfo> asyncResizeInfos = new ArrayList<AbstractPhotoUrlService.ResizeInfo>();
		
		for (ResizeInfo resizeInfo: resizeInfos) {
			
			if (!resizeInfo.isAsync()) {
				String targetFileName = BasePhoto.getPhotoUrlFileName(file.getName(), resizeInfo.getSuffix());
				logger.debug("Try to resize file (" + file.getAbsolutePath() + ") to target file (" + targetFileName + ") in sync mode, calling doResize");
				File targetFile = new File(file.getParent(), targetFileName);
				doResize(file, targetFile, resizeInfo);
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
						File targetFile = new File(file.getParent(), targetFileName);
						doResize(file, targetFile, resizeInfo);
						targetFileCallback.afterResize(targetFile);
					}
					sourceFileCallback.afterResize(file);
				}

			});
		} else {
			sourceFileCallback.afterResize(file);
		}
	}

	private void doResize(final File file, File targetFile, ResizeInfo resizeInfo) {
		if (resizeInfo.resizeImage()) {
			imageService.resizeAndSave(file, targetFile, resizeInfo.getDimension());
		} else {
			imageService.save(file, targetFile);
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

	private void moveFile(File sourceFile, File targetFile, boolean replaceExisting) {
		try {
			if (replaceExisting && targetFile.exists()) {
				FileUtils.forceDelete(targetFile);
			}
			FileUtils.moveFile(sourceFile, targetFile);
		} catch (Exception e) {
			throw new RuntimeException(e);
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
	
	interface AfterResizeCallback {
		public void afterResize(File file);
	}

}
