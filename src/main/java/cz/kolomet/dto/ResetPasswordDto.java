package cz.kolomet.dto;

import javax.validation.constraints.NotNull;

public class ResetPasswordDto {
	
	@NotNull
	private String username;

	@NotNull
	private String captchaText;
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getCaptchaText() {
		return captchaText;
	}

	public void setCaptchaText(String captchaText) {
		this.captchaText = captchaText;
	}

}
