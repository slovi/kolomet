package cz.kolomet.domain;

public interface Photo {
	
	public String getFileName();
	
	public PhotoContainer getParentContainer();
	
	public String getPhotoUrl();
	
	public String getThumbPhotoUrl();
	
	public String getOverPhotoUrl();

}
