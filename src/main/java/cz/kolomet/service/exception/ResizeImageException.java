package cz.kolomet.service.exception;

public class ResizeImageException extends RuntimeException {
	
	private final String fileName;
	
	public ResizeImageException() {
		super("Cannot resize image from entered stream");
		fileName = null;
	}
	
	public ResizeImageException(String fileName) {
		super("Cannot resize image " + fileName);
		this.fileName = fileName;
	}

	public String getFileName() {
		return fileName;
	}

}
