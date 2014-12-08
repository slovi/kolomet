package cz.kolomet.service.impl;

import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.ui.velocity.VelocityEngineUtils;

import cz.kolomet.service.MailService;

public class MailServiceImpl implements MailService {
	
	protected Log logger = LogFactory.getLog(getClass());
	
	private JavaMailSender mailSender;
	
	private VelocityEngine velcoityEngine;
	
	private String from;
	
	private boolean suppressSending = false;
	
	private String encoding;

	@Override
	public void send(final String to, final String subject, final String text) {
		send(new String[] {to}, subject, text);
	}
	
	@Override
	public void send(final String[] to, final String subject, final String text) {
			
		if (logger.isDebugEnabled()) {
			logger.debug("Trying to send email to(" + to + "), subject(" + subject + "), text(" + text + ").");
		}
		
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, encoding);
				messageHelper.setFrom(from);
				messageHelper.setTo(to);
				messageHelper.setSubject(MimeUtility.encodeText(subject, encoding, "Q"));
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
		
		String text = VelocityEngineUtils.mergeTemplateIntoString(velcoityEngine, templateName, this.encoding, params);
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

	public String getEncoding() {
		return encoding;
	}

	public void setEncoding(String encoding) {
		this.encoding = encoding;
	}

}
