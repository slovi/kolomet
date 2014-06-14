package cz.kolomet.service.impl;

import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;
import org.springframework.ui.velocity.VelocityEngineUtils;

import cz.kolomet.service.MailService;

@Service
public class MailServiceImpl implements MailService {
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private VelocityEngine velcoityEngine;
	
	@Value("${mail.sender.from}")
	private String from;
	
	@Value("${mail.sender.suppressSending}")
	private boolean suppressSending = false;

	@Override
	public void send(final String to, final String subject, final String text) {
		send(new String[] {to}, subject, text);
	}
	
	@Override
	public void send(final String[] to, final String subject, final String text) {
			
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage);
				messageHelper.setFrom(from);
				messageHelper.setTo(to);
				messageHelper.setSubject(subject);
				messageHelper.setText(text, true);
			}
		};
		
		if (!suppressSending) {
			mailSender.send(preparator);
		}
	}
	
	@Override
	public void send(String to, String subject, String templateName, Map<String, Object> params) {
		
		send(new String[] {to}, subject, templateName, params);
	}
	
	@Override
	public void send(String[] to, String subject, String templateName, Map<String, Object> params) {
		
		String text = VelocityEngineUtils.mergeTemplateIntoString(velcoityEngine, templateName, params);
		send(to, subject, text);
	}

	public JavaMailSender getMailSender() {
		return mailSender;
	}

	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

	public VelocityEngine getVelcoityEngine() {
		return velcoityEngine;
	}

	public void setVelcoityEngine(VelocityEngine velcoityEngine) {
		this.velcoityEngine = velcoityEngine;
	}

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public boolean isSuppressSending() {
		return suppressSending;
	}

	public void setSuppressSending(boolean suppressSending) {
		this.suppressSending = suppressSending;
	}

}
