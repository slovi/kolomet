package cz.kolomet.util;

import java.io.File;

public class FileRenamer {
	
	private static String sdiak = "áäčďéěíĺľňóôőöŕšťúůűüýřžÁÄČĎÉĚÍĹĽŇÓÔŐÖŔŠŤÚŮŰÜÝŘŽ";
	private static String bdiak = "aacdeeillnoooorstuuuuyrzAACDEEILLNOOOORSTUUUUYRZ";
	
	public static void main(String[] args) {
		
		File folder = new File(args[0]);
		renameFileInFolder(folder);
	}
	
	public static void renameFileInFolder(File folder) {
		
		File[] files = folder.listFiles();
		if (files != null) {
			for (File file: files) {
				if (file.isFile()) {
					renameFile(file);
				} else {
					renameFileInFolder(file);
				}
			}
		}
	}

	private static void renameFile(File file) {
		file.renameTo(new File(file.getParent(), removeDiakritics(file.getName())));
	}

	public static String removeDiakritics(String value) {

		String tx = "";

		for (int p = 0; p < value.length(); p++) {
			if (sdiak.indexOf(value.charAt(p)) != -1) {
				tx += bdiak.charAt(sdiak.indexOf(value.charAt(p)));
			} else {
				tx += value.charAt(p);
			}
		}
		return tx;
	}

}