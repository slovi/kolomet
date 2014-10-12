package cz.kolomet.dto;


public class FileInfo {
	
	private final Long id;
	private final String fileName;
	private final String contentType;
	
	public FileInfo(String fileName) {
		this(null, fileName, null);
	}
	
	public FileInfo(String fileName, String contentType) {
		this(null, fileName, contentType);
	}
	
	public FileInfo(Long id, String fileName, String contentType) {
		this.id = id;
		this.fileName = fileName;
		this.contentType = contentType;
	}
	
	public boolean isNew() {
		return id == null;
	}

	public Long getId() {
		return id;
	}

	public String getFileName() {
		return fileName;
	}
	
	public String getContentType() {
		return contentType;
	}

}
