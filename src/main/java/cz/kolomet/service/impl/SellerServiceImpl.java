package cz.kolomet.service.impl;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cz.kolomet.domain.ApplicationRole;
import cz.kolomet.domain.ApplicationUser;
import cz.kolomet.domain.Seller;
import cz.kolomet.domain.VisitorActivityLog.VisitorActivityType;
import cz.kolomet.repository.ApplicationRoleRepository;
import cz.kolomet.repository.ApplicationUserRepository;
import cz.kolomet.repository.SellerRepository;
import cz.kolomet.security.PasswordGenerator;
import cz.kolomet.service.MailService;
import cz.kolomet.service.SellerService;
import cz.kolomet.service.VisitorActivityLogService;
import cz.kolomet.service.exception.ExistingUserException;

@Service
@Transactional
public class SellerServiceImpl implements SellerService {
	
	@Autowired
	private SellerRepository sellerRepository;
	
	@Autowired
	private VisitorActivityLogService visitorActivityLogService;
	
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
	
	private static final Sort defaultSort() {
    	Order sellerNameOrder = new Order(Direction.ASC, "sellerName");
		return new Sort(sellerNameOrder);
	}
	
	public Page<Seller> findSellerEntries(Pageable pageable) {
		return sellerRepository.findAll(pageable);
	}
	
	public List<Seller> findByRegionCodeKeyOrderBySellerNameAsc(String regionCodeKey) {
		return sellerRepository.findByRegionCodeKeyOrderBySellerNameAsc(regionCodeKey);
	}
    
	@PreAuthorize("principal.isCapableToDeleteSeller(#seller)")
    public void deleteSeller(Seller seller) {
        seller.setEnabled(false);
        sellerRepository.save(seller);
    }
    
	@PreAuthorize("principal.isCapableToEraseSeller(#seller)")
	public void eraseSeller(Seller seller) {
		sellerRepository.delete(seller);
	}
	
	@PostAuthorize("isAnonymous() or principal.isSellerOwner(returnObject)")
	public Seller detail(Long id, String userInfo) {
		Seller seller = findSeller(id);
		visitorActivityLogService.saveVisitorActivityLog(seller, null, userInfo, VisitorActivityType.SELLER_VISIT);
		return seller;
	}
	
	@PostAuthorize("isAnonymous() or principal.isSellerOwner(returnObject)")
    public Seller findSeller(Long id) {
        return sellerRepository.findOne(id);
    }
    
    @PreAuthorize("principal.isCapableToSaveSeller(#seller)")
    public void saveSeller(Seller seller) {
    	
    	String email = seller.getPersonEmail();
    	ApplicationUser user = applicationUserRepository.findByUsernameAndEnabled(email, true); 
    	if (user == null) {
    		
    		seller.normalizeWebUrl();
    		seller.setEnabled(true);
    		seller.normalizeWebUrl();
    		sellerRepository.save(seller);
    		
    		String password = passwordGenerator.generatePassword(user);
        	ApplicationRole applicationRole = applicationRoleRepository.findByRoleName(sellerRoleName);
        	
        	ApplicationUser newUser = new ApplicationUser();
        	newUser.setEnabled(true);
        	newUser.setPassword(passwordEncoder.encodePassword(password, null));
        	newUser.addRole(applicationRole);
        	newUser.setUsername(email);
        	newUser.setSeller(seller);
        	applicationUserRepository.save(newUser);
            
            Map<String, Object> params = new HashMap<String, Object>();
            params.put("username", email);
            params.put("password", password);
            params.put("seller", seller);
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
    
    public List<Seller> findAllSellers() {
    	return sellerRepository.findAll(defaultSort());
    }
    
    public List<Seller> findAllEnabledSellers() {
    	return sellerRepository.findByEnabledOrderBySellerNameAsc(true);
    }
    
    @PreAuthorize("principal.isSellersAll()")
    public List<Seller> findSellerEntries(int firstResult, int maxResults) {
        return sellerRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
	
}
