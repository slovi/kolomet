package cz.kolomet.util;

import org.apache.commons.lang3.StringEscapeUtils;
import org.junit.Test;

public class JavascriptEscape {
	
	@Test
	public void testEscapeJavascript() {
		System.out.println(StringEscapeUtils.escapeEcmaScript("<a href=\"http://www.kr-karlovarsky.cz/cyklo/Stranky/uvod.aspx\" target=\"_blank\"><img src=\"/kolomet/resources/images/partners/cykloportal.png\" title=\"cykloportal\" /></a>"));
	}

}
