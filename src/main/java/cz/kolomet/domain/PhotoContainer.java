package cz.kolomet.domain;

import java.util.List;

public interface PhotoContainer {
	
	public Long getId();
	
	public List<? extends Photo> getPhotos();
	
	public String getPhotoType();
	
	public Photo addPhoto(String fileName, String contentType);

}
