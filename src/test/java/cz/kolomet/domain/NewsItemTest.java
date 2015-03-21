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

}
