package cz.kolomet.domain;

import static org.junit.Assert.assertEquals;

import org.junit.Assert;
import org.junit.Test;

public class NewsItemTest {
	
	@Test
	public void testGetContainedUrl() {
		
		NewsItem item = new NewsItem("test test test <a href=\"http://www.kolomet.cz\">test</a> test test test");
		assertEquals("http://www.kolomet.cz", item.getContainedUrl());
		
		NewsItem item2 = new NewsItem("<a href=\"http://www.kolomet.cz\">test</a> test test test <a href=\"http://www.kolomet.cz\">test</a>");
		assertEquals("http://www.kolomet.cz", item2.getContainedUrl());
		
		NewsItem item3 = new NewsItem(" ");
		Assert.assertNull(item3.getContainedUrl());
		
		NewsItem item4 = new NewsItem("test test test test test test test test test test test test test");
		Assert.assertNull(item4.getContainedUrl());
		
	}
	
	@Test
	public void testGetFacebookText() {
		
		NewsItem item = new NewsItem("test test test <a href=\"http://www.kolomet.cz\">test</a> test test test");
		assertEquals("test test test test test test test", item.getFacebookText());
		
		NewsItem item2 = new NewsItem("<a href=\"http://www.kolomet.cz\">test</a> test test test <a href=\"http://www.kolomet.cz\">test</a>");
		assertEquals("test test test test test", item2.getFacebookText());
		
		NewsItem item3 = new NewsItem(" ");
		assertEquals(" ", item3.getFacebookText());
		
		NewsItem item4 = new NewsItem("test test test test test test test test test test test test test");
		assertEquals("test test test test test test test test test test test test test", item4.getFacebookText());
		
	}
	
	@Test
	public void testTest() {
		
		NewsItem item = new NewsItem("<div> <img alt=\"Koruna Vysociny\" src=\"http://www.kolomet.cz//file/newsitem/111/BANNER_Vrcharska_koruna Vysociny_orig.jpg\" style=\"float:left;margin: 5px 15px 0 0\" title=\"SOUTEZ_I\" /> </div><div><br /></div><div><div><span style=\"background-color: rgb(249, 249, 249); font-size: 1.4em;\"><b>Vrchařská koruna Vysočiny</b></span></div><div><br /></div><div>Vrchařská koruna Vysočiny je akce pro všechny milovníky cyklistiky, fotografování, </div><div>krásné přírody a prostě pro ty, co mají rádi Vysočinu v okolí horní Svratky</div><div>a nebojí se k jejímu poznání šlápnout do pedálů.</div></div>");
		System.out.println(item.getFacebookHeaderText());
		System.out.println(item.getFacebookText());
		System.out.println(item.getContainedImageUrl());
	}

}
