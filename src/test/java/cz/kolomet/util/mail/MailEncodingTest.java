package cz.kolomet.util.mail;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

public class MailEncodingTest {

	
	public static void main(String[] args) throws FileNotFoundException, IOException {
		
		File resource = new File(MailEncodingTest.class.getResource("config.properties").getFile());
		Properties properties = new Properties();
		properties.load(new FileInputStream(resource));
		
		System.out.println(new String(properties.get("applicationuser.mail.register.subject").toString().getBytes("CP1252")));
		
	}
	
}
