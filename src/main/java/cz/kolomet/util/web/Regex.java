package cz.kolomet.util.web;

public class Regex {
	
	public static String EMAIL = "(.+\\\\@.+\\\\..+)";
	public static String PHONE = "(([0-9]{9})|(\\\\+420[0-9]{9}))";
	public static String POSTAL_CODE = "([0-9]{5})";
	
	public String getEmail() {
		return EMAIL;
	}
	
	public String getPhone() {
		return PHONE;
	}
	
	public String getPostalCode() {
		return POSTAL_CODE;
	}

}
