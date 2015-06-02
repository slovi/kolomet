package cz.kolomet.domain;

public enum PlaceTypeColor {
		
	BLUE, GREEN, RED, YELLOW, ORANGE;
	
	private static final String RESOURCES_IMG_PLACES = "resources/img/places/";

	public String getIconUrl() {
		return createImgUrl("");
	}

	public String getMyIconUrl() {
		return createImgUrl("_my");
	}

	public String getLargeIconUrl() {
		return createImgUrl("");
	}

	public String getMyLargeIconUrl() {
		return createImgUrl("_my_large");
	}

	private String createImgUrl(String suffix) {
		return RESOURCES_IMG_PLACES + this.name() + suffix + ".png";
	}

}