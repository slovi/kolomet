package cz.kolomet.service;

import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cz.kolomet.domain.ApplicationPermission;

public interface ApplicationPermissionService {
	
	public Page<ApplicationPermission> findApplicationPermissionEntries(Pageable pageable);
	

	public abstract long countAllApplicationPermissions();


	public abstract void deleteApplicationPermission(ApplicationPermission applicationPermission);


	public abstract ApplicationPermission findApplicationPermission(Long id);


	public abstract List<ApplicationPermission> findAllApplicationPermissions();


	public abstract List<ApplicationPermission> findApplicationPermissionEntries(int firstResult, int maxResults);


	public abstract void saveApplicationPermission(ApplicationPermission applicationPermission);


	public abstract ApplicationPermission updateApplicationPermission(ApplicationPermission applicationPermission);

}
