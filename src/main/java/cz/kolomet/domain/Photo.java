package cz.kolomet.domain;

public interface Photo {
	
	public boolean isNew();
	
	public String getFileName();
	
	public PhotoContainer getParentContainer();
	
	public String getPhotoUrl();
	
	public String getThumbPhotoUrl();
	
	public String getOverPhotoUrl();
	
	public String getDetailPhotoUrl();

}
