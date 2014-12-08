package cz.kolomet.util;

import java.io.Closeable;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.channels.FileChannel;

public class PhotoUrlCopier {
	
   public static final long ONE_KB = 1024;

   public static final long ONE_MB = ONE_KB * ONE_KB;

   private static final long FILE_COPY_BUFFER_SIZE = ONE_MB * 30;

	public static void main(String[] args) {
		
		File sourceDir = new File("/data/product/source");
		for (int i = 25; i < 150025; i++) {
			File targetDir = new File("/data/product/" + i);
			targetDir.mkdir();
			for (File sourceFile: sourceDir.listFiles()) {
				try {
					if (sourceFile.isFile()) {
						copyFile(sourceFile, new File(targetDir, sourceFile.getName()));
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
	}
	
	public static void copyFile(File srcFile, File destFile) throws IOException {
        FileInputStream fis = null;
        FileOutputStream fos = null;
        FileChannel input = null;
        FileChannel output = null;
        try {
            fis = new FileInputStream(srcFile);
            fos = new FileOutputStream(destFile);
            input  = fis.getChannel();
            output = fos.getChannel();
            long size = input.size();
            long pos = 0;
            long count = 0;
            while (pos < size) {
                count = (size - pos) > FILE_COPY_BUFFER_SIZE ? FILE_COPY_BUFFER_SIZE : (size - pos);
                pos += output.transferFrom(input, pos, count);
            }
        } finally {
            closeQuietly(output);
            closeQuietly(fos);
            closeQuietly(input);
            closeQuietly(fis);
        }
	}
	
    public static void closeQuietly(Closeable closeable) {
        try {
            if (closeable != null) {
                closeable.close();
            }
        } catch (IOException ioe) {
            // ignore
        }
    }
	
}
