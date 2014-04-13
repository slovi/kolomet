package cz.kolomet.security;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import cz.kolomet.domain.ApplicationPermission;
import cz.kolomet.domain.ApplicationRole;
import cz.kolomet.domain.ApplicationUser;

public class ApplicationUserDetails implements UserDetails {
	
	private static final String ROLE_VOTER_PREFIX = "ROLE_";
	private final ApplicationUser user;
	private final Long sellerId;
	private final Collection<? extends GrantedAuthority> authorities;
	
	public ApplicationUserDetails(ApplicationUser user) {
		this.user = user;
		this.sellerId = user.getSeller().getId();
		this.authorities = resolveAuthorities();
	}
	
	public static ApplicationUserDetails getActualApplicationUserDetails() {
		SecurityContext context = SecurityContextHolder.getContext();
		Authentication authentication = context.getAuthentication();
		Object principal = authentication.getPrincipal();
		return principal instanceof ApplicationUserDetails ? (ApplicationUserDetails) principal : null;
	}

	private Collection<? extends GrantedAuthority> resolveAuthorities() {
		Set<GrantedAuthority> permissions = new HashSet<GrantedAuthority>();
		for (ApplicationRole role: this.user.getRoles()) {
			for (ApplicationPermission permission: role.getPermissions()) {
				permissions.add(new SimpleGrantedAuthority(ROLE_VOTER_PREFIX + permission.getPermissionName()));
			}
		}
		return permissions;
	}
	
	public boolean hasAuthority(String authorityName) {
		return this.authorities.contains(ROLE_VOTER_PREFIX + authorityName); 
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return authorities;
	}

	@Override
	public String getPassword() {
		return user.getPassword();
	}

	@Override
	public String getUsername() {
		return user.getUsername();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return user.getEnabled();
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return user.getEnabled();
	}

	public ApplicationUser getUser() {
		return user;
	}

	public Long getSellerId() {
		return sellerId;
	}

}
