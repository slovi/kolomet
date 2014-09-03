package cz.kolomet.service.impl;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.imageio.ImageIO;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import cz.kolomet.service.ImageService;

@Service
public class ImageServiceImpl implements ImageService {
	
	protected final Log logger = LogFactory.getLog(getClass());
	
	@Override
	public void save(File sourceFile, File targetFile) {
		InputStream in = null; 
		OutputStream out = null; 
		try {
			in = new FileInputStream(sourceFile);
			out = new FileOutputStream(targetFile);
			logger.debug("Try to save image: " + sourceFile + " " + targetFile);
			save(in, out);
		} catch (FileNotFoundException e) {
			logger.error(e, e);
			throw new RuntimeException(e);
		} finally {
			closeIfPossible(in);
			closeIfPossible(out);
		}
	}
	
	@Override
	public void save(InputStream inputStream, OutputStream outputStream) {
		try {			
			logger.debug("Writing data to stream " + outputStream);
			IOUtils.copy(inputStream, outputStream);
		} catch (IOException e) {
			logger.error(e, e);
			throw new RuntimeException(e);
		}
	}

	@Override
	public void resizeAndSave(InputStream inputStream, OutputStream outputStream, Dimension toDimension) {
		
		BufferedImage image = readImage(inputStream);
		BufferedImage scaledImage = resize(image, toDimension);
		saveImage(scaledImage, outputStream);
	}
	
	@Override
	public void resizeAndSave(File sourceFile, File targetFile, Dimension toDimension) {
		
		InputStream in = null;
		OutputStream out = null;
		try {
			logger.debug("Trying resize and save image: " + sourceFile + " " + targetFile);
			File tempTargetFile = new File(targetFile.getParent(), FilenameUtils.getBaseName(targetFile.getName()));
			in = new FileInputStream(sourceFile);
			out = new FileOutputStream(tempTargetFile);
			resizeAndSave(in, out, toDimension);
			FileUtils.deleteQuietly(targetFile);
			FileUtils.moveFile(tempTargetFile, targetFile);
		} catch (FileNotFoundException e) {
			logger.error(e, e);
			throw new RuntimeException(e);
		} catch (IOException e) {
			logger.error(e, e);
			throw new RuntimeException(e);
		} finally {
			closeIfPossible(in);
			closeIfPossible(out);
		}
	}
	
	private BufferedImage readImage(InputStream inputStream) {
		try {
			logger.debug("Reading image from stream: " + inputStream);
			return ImageIO.read(inputStream);
		} catch (IOException e) {
			logger.error(e, e);
			throw new RuntimeException(e);
		}
	}

	private BufferedImage resize(BufferedImage image, Dimension toDimension) {
		Dimension actualDimension = new Dimension(image.getWidth(), image.getHeight());
		Dimension newDimension = calculateDimension(actualDimension, toDimension);
		Image scaledImage = image.getScaledInstance(newDimension.width, newDimension.height, Image.SCALE_SMOOTH);
		BufferedImage newImage = new BufferedImage(toDimension.width, toDimension.height, BufferedImage.TYPE_INT_RGB);
		Graphics2D g = newImage.createGraphics();
		int x = (toDimension.width - newDimension.width) / 2;
		int y = (toDimension.height - newDimension.height) / 2;
		g.setColor(Color.WHITE);
		g.fillRect(0, 0, toDimension.width, toDimension.height);
		g.drawImage(scaledImage, x, y, Color.WHITE, null);
		g.dispose();
		return newImage;
	}
	
	private void saveImage(BufferedImage image, OutputStream out) {
		try {
			logger.debug("Writing image to stream: " + out);
			ImageIO.write(image, "jpg", out);
		} catch (IOException e) {
			logger.error(e, e);
			throw new RuntimeException(e);
		}
	}

	private Dimension calculateDimension(Dimension actualDimension, Dimension toDimension) {
		float rateX = (float) toDimension.getWidth() / (float) actualDimension.getWidth();
		float rateY = (float) toDimension.getHeight() / (float) actualDimension.getHeight();
		if (rateX > rateY) {
			return new Dimension((int) (actualDimension.getWidth() * rateY), (int) (actualDimension.getHeight() * rateY));
		} else {
			return new Dimension((int) (actualDimension.getWidth() * rateX), (int) (actualDimension.getHeight() * rateX));
		}
	}

	private void closeIfPossible(OutputStream out) {
		if (out != null) {
			try {
				out.close();
			} catch (IOException e) {
				logger.error(e, e);
				throw new RuntimeException(e);
			}
		}
	}

	private void closeIfPossible(InputStream in) {
		if (in != null) {
			try {
				in.close();
			} catch (IOException e) {
				logger.error(e, e);
				throw new RuntimeException(e);
			}
		}
	}

}
