package cz.kolomet.dto;

import java.util.List;

public class ApplicationUserRegistration {
	
	private String name;
	
	private String surname;
	
	private String username;
	
	private String phone;

	private String password;

	private String passwordConfirm;
	
	private String captchaText;
	
	private List<FileInfo> fileInfos;
	
	private Boolean conditionAgreement;
	
	private Boolean privateAgreement;

	public void clearCaptchaText() {
		captchaText = null;
	}
	
	public boolean samePasswordValues() {
		return password != null && password.equals(passwordConfirm);
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordConfirm() {
		return passwordConfirm;
	}

	public void setPasswordConfirm(String passwordConfirm) {
		this.passwordConfirm = passwordConfirm;
	}

	public String getCaptchaText() {
		return captchaText;
	}

	public void setCaptchaText(String captchaText) {
		this.captchaText = captchaText;
	}

	public List<FileInfo> getFileInfos() {
		return fileInfos;
	}

	public void setFileInfos(List<FileInfo> fileInfos) {
		this.fileInfos = fileInfos;
	}

	public Boolean getConditionAgreement() {
		return conditionAgreement;
	}

	public void setConditionAgreement(Boolean conditionAgreement) {
		this.conditionAgreement = conditionAgreement;
	}

	public Boolean getPrivateAgreement() {
		return privateAgreement;
	}

	public void setPrivateAgreement(Boolean privateAgreement) {
		this.privateAgreement = privateAgreement;
	}
	
}
