package cz.kolomet.dto;

import java.util.List;

import cz.kolomet.domain.codelist.CountryState;

public class ApplicationUserRegistration {
	
	private String name;
	
	private String surname;
	
	private String username;
	
	private String nickname;
	
	private String phone;

	private String password;

	private String passwordConfirm;
	
	private String captchaText;
	
	private String street;
	
	private String houseNr;
	
	private String postCode;
	
	private String city;
	
	private CountryState countryState;
	
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

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
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

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getHouseNr() {
		return houseNr;
	}

	public void setHouseNr(String houseNr) {
		this.houseNr = houseNr;
	}

	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public CountryState getCountryState() {
		return countryState;
	}

	public void setCountryState(CountryState countryState) {
		this.countryState = countryState;
	}
	
}
