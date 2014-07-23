package cz.kolomet.domain;

public enum RateType {
	
	PLACE("places");

	private String id;
	
	private RateType(String id) {
		this.id = id;
	}

	public String getId() {
		return id;
	}

}
