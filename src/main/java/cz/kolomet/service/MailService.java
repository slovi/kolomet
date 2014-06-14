package cz.kolomet.service;

import java.util.Map;

public interface MailService {
	
	public void send(String to, String subject, String text);
	
	public void send(final String[] to, final String subject, final String text);
	
	public void send(String[] to, String subject, String templateName, Map<String, Object> params);
	
	public void send(String to, String subject, String templateName, Map<String, Object> params);

}
