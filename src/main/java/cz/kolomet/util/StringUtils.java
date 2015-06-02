package cz.kolomet.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.apache.commons.lang3.text.translate.EntityArrays;
import org.apache.commons.lang3.text.translate.LookupTranslator;
import org.apache.commons.lang3.text.translate.UnicodeEscaper;

public class StringUtils {
	
	private static String sdiak = "áäčďéěíĺľňóôőöŕšťúůűüýřžÁÄČĎÉĚÍĹĽŇÓÔŐÖŔŠŤÚŮŰÜÝŘŽ";
	private static String bdiak = "aacdeeillnoooorstuuuuyrzAACDEEILLNOOOORSTUUUUYRZ";

	public static String encodeUrl(String url) {
		return encodeUrl(url, "UTF-8");
	}
	
	public static String encodeUrl(String url, String encoding) {
		try {
			return URLEncoder.encode(url, encoding);
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException(e);
		}
	}
	
	public static String simplify(String value) {
		return StringUtils.removeDiakritics(value).toLowerCase().replaceAll(" ", "-");
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
	
	public static String escapeJavaString(String input) {
		return new LookupTranslator(EntityArrays.JAVA_CTRL_CHARS_ESCAPE()).with(UnicodeEscaper.outsideOf(32, 0x7f)).translate(input);
	}

}
