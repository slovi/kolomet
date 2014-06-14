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
import cz.kolomet.domain.Product;
import cz.kolomet.domain.Seller;

public class ApplicationUserDetails implements UserDetails {
	
	private static final String ROLE_VOTER_PREFIX = "ROLE_";
	private final ApplicationUser user;
	private final Long sellerId;
	private final Collection<? extends GrantedAuthority> authorities;
	
	public ApplicationUserDetails(ApplicationUser user) {
		this.user = user;
		this.sellerId = user.getSeller() != null ? user.getSeller().getId() : null;
		this.authorities = resolveAuthorities();
	}
	
	public static ApplicationUserDetails getActualApplicationUserDetails() {
		SecurityContext context = SecurityContextHolder.getContext();
		Authentication authentication = context.getAuthentication();
		Object principal = authentication.getPrincipal();
		return principal instanceof ApplicationUserDetails ? (ApplicationUserDetails) principal : null;
	}
	
	public boolean isProductsOwn() {
		return hasAuthority("per_products_own");
	}
	
	public boolean isProductsAll() {
		return hasAuthority("per_products_all");
	}
	
	public boolean isApplicationUsersAll() {
		return hasAuthority("per_applicationusers_all");
	}
	
	public boolean isApplicationUsersOwn() {
		return hasAuthority("per_applicationusers_own");
	}
	
	public boolean isSellersAll() {
		return hasAuthority("per_sellers_all");
	}

	public boolean isSellersOwn() {
		return hasAuthority("per_sellers_own");
	}
	
	public boolean isSellerOwner(Seller seller) {
		return isSellersAll() || (isSellersOwn() && seller.getId().equals(getSellerId()));
	}
	
	public boolean isCapableToSaveSeller(Seller seller) {
		return isSellersAll();
	}
	
	public boolean isCapableToUpdateSeller(Seller seller) {
		return isSellerOwner(seller);
	}
	
	public boolean isCapableToDeleteSeller(Seller seller) {
		return isSellersAll();
	}
	
	public boolean isCapableToDisplaySeller(Seller seller) {
		return isSellerOwner(seller);
	}
	
	public boolean isProductOwner(Product product) {
		return isProductsAll() || (isProductsOwn() && isSellerOwner(product.getSeller()));
	}
	
	public boolean isCapableToEditValidDates(Product product) {
		return isProductsAll() || product.isValidDateChangeable() || product.isCopyState();
	}
	
	public boolean isCapableToSaveProduct(Product product) {
		return isProductOwner(product);
	}
	
	public boolean isCapableToUpdateProduct(Product product) {
		return isProductsAll() || (isProductOwner(product) && (product.isValid() || product.isWaitingForValid()));
	}
	
	public boolean isCapableToCopyProduct(Product product) {
		return isProductsAll() || (isProductOwner(product));
	}
	
	public boolean isCapableToDeleteProduct(Product product) {
		return isProductsAll() || (isProductOwner(product) && product.isValid() );
	}
	
	public boolean isCapableToDisplayProduct(Product product) {
		return true;
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
		for (GrantedAuthority auth: this.authorities) {
			if (auth.getAuthority().equals(ROLE_VOTER_PREFIX + authorityName)) {
				return true;
			}
		}
		return false;
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
	
	public Long getUserId() {
		return user.getId();
	}

}
