package cz.kolomet.domain;

import java.awt.Dimension;
import java.io.File;

public interface PhotoContainerService {
	
	public void savePhoto(Photo photo);
	
	public void deletePhoto(Photo photo);
	
	public void resizePhoto(File photo);
	
	public ResizeInfo[] getResizeInfos();

	public class ResizeInfo {
		
		private final Dimension dimension;
		private final String suffix;
		private final boolean async;
		
		public ResizeInfo(String suffix) {
			this(null, suffix, false);
		}
		
		public ResizeInfo(Dimension dimension, String suffix) {
			this(dimension, suffix, true);
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
