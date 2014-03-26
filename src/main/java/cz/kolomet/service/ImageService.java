package cz.kolomet.service;

import java.awt.Dimension;
import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;

public interface ImageService {
	
	public void resizeAndSave(InputStream inputStream, OutputStream outputStream, Dimension toDimension);
	
	public void resizeAndSave(File sourceFile, File targetFile, Dimension toDimension);

}
