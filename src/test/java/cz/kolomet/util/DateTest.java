package cz.kolomet.util;

import java.util.Date;

import org.junit.Test;

public class DateTest {
	
	@Test
	public void testDate() {
		
		Date startDate = new Date(1416791540112l);
		System.out.println(startDate);
		
		Date endDate = new Date(1416790824723l);
		System.out.println(endDate);
	}

}
