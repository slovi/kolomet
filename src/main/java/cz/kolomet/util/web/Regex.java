package cz.kolomet.util.web;

public class Regex {
	
	public static String EMAIL = "(.+\\\\@.+\\\\..+)";
	public static String PHONE = "(([0-9]{9})|(\\\\+420[0-9]{9}))"; 
	
	public String getEmail() {
		return EMAIL;
	}
	
	public String getPhone() {
		return PHONE;
	}

}
