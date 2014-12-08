package cz.kolomet.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "classpath*:META-INF/spring/applicationContext-email.xml",
		"classpath*:META-INF/spring/applicationContext-config.xml" })
public class MailServiceTest {

	@Autowired
	private MailService mailService;

	@Test
	public void testSend() {
		mailService.send("jiri.slovak@gmail.com", "Vytvoření účtu", "ahoj");
	}

}
