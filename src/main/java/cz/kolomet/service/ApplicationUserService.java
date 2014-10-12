package cz.kolomet.service;

import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cz.kolomet.domain.ApplicationUser;
import cz.kolomet.domain.ApplicationUserPhoto;
import cz.kolomet.domain.PhotoContainerService;
import cz.kolomet.dto.ApplicationUserPasswordDto;

public interface ApplicationUserService extends PhotoContainerService {
	
	public void activateApplicationUser(String token);
	
	public void registerApplicationUser(ApplicationUser applicationUser);
	
	public void saveApplicationUser(ApplicationUser applicationUser, boolean generatePassword);
	
	public void updatePassword(ApplicationUserPasswordDto applicationUserPassword);
	
	public void resetPassword(String username);
	
	public Page<ApplicationUser> findApplicationUserEntries(Pageable pageable);
	
	public long countAllApplicationUsers();

	public void deleteApplicationUser(ApplicationUser applicationUser);

	public ApplicationUser findApplicationUser(Long id);

	public List<ApplicationUser> findAllApplicationUsers();

	public List<ApplicationUser> findApplicationUserEntries(int firstResult, int maxResults);

	public void saveApplicationUser(ApplicationUser applicationUser);

	public ApplicationUser updateApplicationUser(ApplicationUser applicationUser);
	
	public ApplicationUserPhoto findApplicationUserPhoto(Long id);

}
