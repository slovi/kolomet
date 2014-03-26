package cz.kolomet.service.impl;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;
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

import org.springframework.stereotype.Service;

import cz.kolomet.service.ImageService;

@Service
public class ImageServiceImpl implements ImageService {

	@Override
	public void resizeAndSave(InputStream inputStream, OutputStream outputStream, Dimension toDimension) {
		BufferedImage image = read(inputStream);
		BufferedImage scaledImage = resize(image, toDimension);
		save(scaledImage, outputStream);
		try {
			inputStream.close();
			outputStream.close();
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}
	
	@Override
	public void resizeAndSave(File sourceFile, File targetFile, Dimension toDimension) {
		try {
			resizeAndSave(new FileInputStream(sourceFile), new FileOutputStream(targetFile), toDimension);
		} catch (FileNotFoundException e) {
			throw new RuntimeException(e);
		}
	}
	
	private BufferedImage read(InputStream inputStream) {
		try {
			return ImageIO.read(inputStream);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}

	private BufferedImage resize(BufferedImage image, Dimension toDimension) {
		Dimension actualDimension = new Dimension(image.getWidth(), image.getHeight());
		Dimension newDimension = calculateDimension(actualDimension, toDimension);
		Image scaledImage = image.getScaledInstance(newDimension.width, newDimension.height, Image.SCALE_SMOOTH);
		BufferedImage newImage = new BufferedImage(newDimension.width, newDimension.height, BufferedImage.TYPE_INT_RGB);
		Graphics g = newImage.createGraphics();
		g.drawImage(scaledImage, 0, 0, new Color(0, 0, 0), null);
		g.dispose();
		return newImage;
	}
	
	private void save(BufferedImage image, OutputStream out) {
		try {
			ImageIO.write(image, "jpg", out);
		} catch (IOException e) {
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

}
