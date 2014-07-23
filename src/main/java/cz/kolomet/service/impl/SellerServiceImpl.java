package cz.kolomet.service.impl;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PostFilter;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.encoding.PasswordEncoder;

import cz.kolomet.domain.ApplicationRole;
import cz.kolomet.domain.ApplicationUser;
import cz.kolomet.domain.Seller;
import cz.kolomet.repository.ApplicationRoleRepository;
import cz.kolomet.repository.ApplicationUserRepository;
import cz.kolomet.repository.SellerRepository;
import cz.kolomet.security.PasswordGenerator;
import cz.kolomet.service.MailService;
import cz.kolomet.service.SellerService;
import cz.kolomet.service.exception.ExistingUserException;

public class SellerServiceImpl implements SellerService {
	
	@Autowired
	private SellerRepository sellerRepository;
	
	@Autowired
	private ApplicationUserRepository applicationUserRepository;
	
	@Autowired
	private MailService mailService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private PasswordGenerator passwordGenerator;
	
	@Autowired
	private ApplicationRoleRepository applicationRoleRepository;
	
	@Value("${seller.roleName}")
	private String sellerRoleName;
	
	@Value("${seller.mail.new.subject}")
	private String newSellerEmailSubject;
	
	@Value("${seller.mail.new.template}")
	private String newSellerEmailTemplate;
	
	public Page<Seller> findSellerEntries(Pageable pageable) {
		return sellerRepository.findAll(pageable);
	}
    
	@PreAuthorize("principal.isSellersAll()")
    public void deleteSeller(Seller seller) {
        seller.setEnabled(false);
        sellerRepository.save(seller);
    }
    
	@PreAuthorize("principal.isCapableToEraseSeller(#seller)")
	public void eraseSeller(Seller seller) {
		sellerRepository.delete(seller);
	}
	
	@PostAuthorize("isAnonymous() or principal.isSellerOwner(returnObject)")
    public Seller findSeller(Long id) {
        return sellerRepository.findOne(id);
    }
    
    @PreAuthorize("principal.isCapableToSaveSeller(#seller)")
    public void saveSeller(Seller seller) {
    	
    	String email = seller.getAddressEmail();
    	ApplicationUser user = applicationUserRepository.findByUsername(email); 
    	if (user == null) {
    		
    		String password = passwordGenerator.generatePassword(user);
        	
        	ApplicationRole applicationRole = applicationRoleRepository.findByRoleName(sellerRoleName);
        	
        	ApplicationUser applicationUser = new ApplicationUser();
        	applicationUser.setEnabled(true);
        	applicationUser.setPassword(passwordEncoder.encodePassword(password, null));
        	applicationUser.setSeller(seller);
        	applicationUser.addRole(applicationRole);
        	applicationUser.setUsername(email);
        	
        	applicationUserRepository.save(applicationUser);
            sellerRepository.save(seller);
            
            Map<String, Object> params = new HashMap<String, Object>();
            params.put("username", email);
            params.put("password", password);
            params.put("seller", seller);
            
            seller.normalizeWebUrl();
            
            mailService.send(email, newSellerEmailSubject, newSellerEmailTemplate, params);
            
    	} else {
    		throw new ExistingUserException(user);
    	}
    	    	
    }
    
    @PreAuthorize("principal.isCapableToUpdateSeller(#seller)")
    public Seller updateSeller(Seller seller) {
    	
    	seller.normalizeWebUrl();
    	
   		return sellerRepository.save(seller);
    }
    
    @PreAuthorize("principal.isSellersAll()")
    public long countAllSellers() {
        return sellerRepository.count();
    }
    
    @PostFilter("hasPermission(filterObject, 'read')")
    public List<Seller> findAllSellers() {
        return sellerRepository.findAll();
    }
    
    @PreAuthorize("principal.isSellersAll()")
    public List<Seller> findSellerEntries(int firstResult, int maxResults) {
        return sellerRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
	
}
