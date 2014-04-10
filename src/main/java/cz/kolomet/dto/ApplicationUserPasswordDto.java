package cz.kolomet.dto;

import javax.validation.constraints.NotNull;

import org.springframework.roo.addon.equals.RooEquals;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooEquals
@RooSerializable
public class ApplicationUserPasswordDto {
	
	private String username;
	
	@NotNull
	private String password;
	
	@NotNull
	private String newPassword;
	
	@NotNull
	private String newPasswordConfirmation;
	
	public boolean sameNewPassword() {
		return newPassword.equals(newPasswordConfirmation);
	}
	
}
