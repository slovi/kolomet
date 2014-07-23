package cz.kolomet.web.admin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.MessageSourceAware;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cz.kolomet.domain.Seller;
import cz.kolomet.security.ApplicationUserDetails;
import cz.kolomet.service.SellerPhotoUrlService;
import cz.kolomet.service.SellerStatusService;
import cz.kolomet.service.exception.ExistingUserException;

@RequestMapping("/admin/sellers")
@Controller
@RooWebScaffold(path = "admin/sellers", formBackingObject = Seller.class)
public class SellerController extends AbstractAdminController implements MessageSourceAware {
	
	private MessageSourceAccessor messages;
	
	@Autowired
	private SellerStatusService sellerStatusService;
	
	@Autowired
	private SellerPhotoUrlService sellerPhotoUrlService;
	
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        return "redirect:/public/sellers/detail/" + id;
    }
	
    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
    	
    	Seller seller = new Seller();
    	seller.setSellerStatus(sellerStatusService.findSellerStatus("sellst_ord"));
    	
        populateEditForm(uiModel, seller);
        List<String[]> dependencies = new ArrayList<String[]>();
        if (countryStateService.countAllCountryStates() == 0) {
            dependencies.add(new String[] { "countrystate", "admin/countrystates" });
        }
        if (regionService.countAllRegions() == 0) {
            dependencies.add(new String[] { "region", "admin/regions" });
        }
        if (countryStateService.countAllCountryStates() == 0) {
            dependencies.add(new String[] { "countrystate", "admin/countrystates" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "admin/sellers/create";
    }
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Seller seller, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, seller);
            return "admin/sellers/create";
        }
        try {
        	sellerService.saveSeller(seller);
        } catch (ExistingUserException e) {
        	bindingResult.addError(new ObjectError("seller", messages.getMessage(e.getCode(), new Object[]{e.getApplicationUser().getUsername()})));
        	populateEditForm(uiModel, seller);
        	return "admin/sellers/create";
        }
        savePhotos(seller, sellerPhotoUrlService, seller.getContents());
        uiModel.asMap().clear();
        return "redirect:/public/sellers/detail/" + seller.getId();
    }
	
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid Seller seller, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {

    	if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, seller);
            return "admin/sellers/update";
        }                     
        
        if (ApplicationUserDetails.getActualApplicationUserDetails().isSellersOwn()) {
        	// reset values which seller cannot override
        	Seller actualSeller = sellerService.findSeller(seller.getId());
        	seller.setSellerStatus(actualSeller.getSellerStatus());
        	seller.setEnabled(actualSeller.getEnabled());
        }
        
        try {
        	sellerService.updateSeller(seller);
        } catch (ExistingUserException e) {
        	bindingResult.addError(new ObjectError("seller", messages.getMessage(e.getCode(), new Object[]{e.getApplicationUser().getUsername()})));
        	populateEditForm(uiModel, seller);
        	return "admin/sellers/update";
        }
        uiModel.asMap().clear();
        savePhotos(seller, sellerPhotoUrlService, seller.getContents());
        return "redirect:/public/sellers/detail/" + seller.getId();
    }
	
    @RequestMapping(produces = "text/html")
    public String list(Pageable pageable, Model uiModel) {
        if (pageable != null) {
        	Page<Seller> page = sellerService.findSellerEntries(pageable);
            uiModel.addAttribute("sellers", page.getContent());
            uiModel.addAttribute("maxPages", page.getTotalPages());
        } else {
            uiModel.addAttribute("sellers", sellerService.findAllSellers());
        }
        addDateTimeFormatPatterns(uiModel);
        return "admin/sellers/list";
    }
    
    @RequestMapping(value = "/{id}", params = {"erase"}, method = RequestMethod.DELETE, produces = "text/html")
    public String erase(@PathVariable("id") Long id, Model uiModel) {
        Seller seller = sellerService.findSeller(id);
        sellerService.eraseSeller(seller);
        return "redirect:/admin/sellers";
    }
	
    @Override
    public void setMessageSource(MessageSource messageSource) {
    	this.messages = new MessageSourceAccessor(messageSource);
    }
    
}
