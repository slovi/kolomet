package cz.kolomet.dto;

import java.io.Serializable;
import javax.validation.constraints.NotNull;

import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;public class ApplicationUserPasswordDto implements Serializable {
	
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
	

	public String toString() {
        return ReflectionToStringBuilder.toString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }

	public boolean equals(Object obj) {
        if (!(obj instanceof ApplicationUserPasswordDto)) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        ApplicationUserPasswordDto rhs = (ApplicationUserPasswordDto) obj;
        return new EqualsBuilder().append(newPassword, rhs.newPassword).append(newPasswordConfirmation, rhs.newPasswordConfirmation).append(password, rhs.password).append(username, rhs.username).isEquals();
    }

	public int hashCode() {
        return new HashCodeBuilder().append(newPassword).append(newPasswordConfirmation).append(password).append(username).toHashCode();
    }

	public String getUsername() {
        return this.username;
    }

	public void setUsername(String username) {
        this.username = username;
    }

	public String getPassword() {
        return this.password;
    }

	public void setPassword(String password) {
        this.password = password;
    }

	public String getNewPassword() {
        return this.newPassword;
    }

	public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

	public String getNewPasswordConfirmation() {
        return this.newPasswordConfirmation;
    }

	public void setNewPasswordConfirmation(String newPasswordConfirmation) {
        this.newPasswordConfirmation = newPasswordConfirmation;
    }

	private static final long serialVersionUID = 1L;
}
