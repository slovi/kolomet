package cz.kolomet.dto;

import java.util.List;

import cz.kolomet.domain.ApplicationRole;
import cz.kolomet.domain.Seller;

public class ApplicationUserFormDto {
	
	private Long id;
	
	private String name;
	
	private String surname;
	
	private String nickname;
	
	private String email;
	
	private String password;
	
	private Boolean enabled;
	
	private List<ApplicationRole> applicationRoles;
	
	private Seller seller;
	
	private FileInfo fileInfo;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public List<ApplicationRole> getApplicationRoles() {
		return applicationRoles;
	}

	public void setApplicationRoles(List<ApplicationRole> applicationRoles) {
		this.applicationRoles = applicationRoles;
	}

	public Seller getSeller() {
		return seller;
	}

	public void setSeller(Seller seller) {
		this.seller = seller;
	}

	public FileInfo getFileInfo() {
		return fileInfo;
	}

	public void setFileInfo(FileInfo fileInfo) {
		this.fileInfo = fileInfo;
	}
	
}
