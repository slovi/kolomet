package cz.kolomet.domain;

import java.io.File;

public interface PhotoContainerService {
	
	public void savePhoto(Photo photo, File dest);
	
	public void resizePhoto(File photo);

}
