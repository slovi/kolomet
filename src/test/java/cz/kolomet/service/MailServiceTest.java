package cz.kolomet.service;

import static org.easymock.EasyMock.capture;
import static org.easymock.EasyMock.createNiceMock;
import static org.easymock.EasyMock.expectLastCall;
import static org.easymock.EasyMock.replay;
import static org.easymock.EasyMock.verify;

import java.util.HashMap;

import javax.mail.Session;
import javax.mail.internet.MimeMessage;

import org.apache.velocity.app.VelocityEngine;
import org.easymock.Capture;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;

import cz.kolomet.service.impl.MailServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:META-INF/spring/applicationContext-email-test.xml")
public class MailServiceTest {
	
	@Autowired
	private VelocityEngine velocityEngine;
	
	@Test
	public void testSendMail() throws Exception {
		
		Capture<MimeMessagePreparator> mimeMessageCapture = new Capture<MimeMessagePreparator>();
		
		JavaMailSender sender = createNiceMock(JavaMailSender.class);
		sender.send(capture(mimeMessageCapture));
		expectLastCall();
		replay(sender);
		
		MailServiceImpl mailService = new MailServiceImpl();
		mailService.setMailSender(sender);
		mailService.setFrom("jslovak@gmail.com");
		mailService.setVelcoityEngine(velocityEngine);
		
		mailService.send("jslovak@gmail.com", "žluťoučký kůň", "registrationrequest_client.vm", new HashMap<String, Object>());

		verify(sender);
		
		MimeMessagePreparator mimeMessagePreparator = mimeMessageCapture.getValue();

		MimeMessage mimeMessage = new MimeMessage((Session) null);
		mimeMessagePreparator.prepare(mimeMessage);
		Assert.notNull(mimeMessage.getContent());
		System.out.println(mimeMessage.getContent());
		
	}

}