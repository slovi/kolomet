package cz.kolomet.web.admin;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cz.kolomet.domain.ApplicationUser;
import cz.kolomet.service.ApplicationRoleService;
import cz.kolomet.service.SellerService;
import cz.kolomet.service.exception.ExistingUserException;

@RequestMapping("/admin/applicationusers")
@Controller
@RooWebScaffold(path = "admin/applicationusers", formBackingObject = ApplicationUser.class)
public class ApplicationUserController extends AbstractAdminController {
	
    @Autowired
    private ApplicationRoleService applicationRoleService;
	
	@Autowired
	private SellerService sellerService;
	
    @RequestMapping(produces = "text/html")
    public String list(Pageable pageable, Model uiModel) {
        if (pageable != null) {
        	Page<ApplicationUser> page = applicationUserService.findApplicationUserEntries(pageable);
            uiModel.addAttribute("applicationusers", page.getContent());
            uiModel.addAttribute("maxPages", page.getTotalPages());
        } else {
            uiModel.addAttribute("applicationusers", applicationUserService.findAllApplicationUsers());
        }
        addDateTimeFormatPatterns(uiModel);
        return "admin/applicationusers/list";
    }
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid ApplicationUser applicationUser, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, applicationUser);
            return "admin/applicationusers/create";
        }
        try {
        	applicationUserService.saveApplicationUser(applicationUser);
        } catch (ExistingUserException e) {
        	bindingResult.addError(new ObjectError("applicationuser", messageSourceAcessor.getMessage(e.getCode(), new Object[]{e.getApplicationUser().getUsername()})));
        	populateEditForm(uiModel, applicationUser);
            return "admin/applicationusers/create";
        }
        uiModel.asMap().clear();
        return "redirect:/admin/applicationusers/" + applicationUser.getId();
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid ApplicationUser applicationUser, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, applicationUser);
            return "admin/applicationusers/update";
        }
        try {
        	applicationUserService.updateApplicationUser(applicationUser);
	    } catch (ExistingUserException e) {
	    	bindingResult.addError(new ObjectError("applicationuser", messageSourceAcessor.getMessage(e.getCode(), new Object[]{e.getApplicationUser().getUsername()})));
	    	populateEditForm(uiModel, applicationUser);
	        return "admin/applicationusers/update";
	    }
        uiModel.asMap().clear();
        return "redirect:/admin/applicationusers/" + applicationUser.getId();
    }
    
}
