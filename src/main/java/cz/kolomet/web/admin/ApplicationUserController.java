package cz.kolomet.web.admin;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.mail.MailException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cz.kolomet.domain.ApplicationUser;
import cz.kolomet.domain.BasePhoto;
import cz.kolomet.service.ApplicationRoleService;
import cz.kolomet.service.ApplicationUserService;
import cz.kolomet.service.SellerService;
import cz.kolomet.service.exception.ExistingUserException;
import flexjson.JSONSerializer;

@RequestMapping("/admin/applicationusers")
@Controller
public class ApplicationUserController extends AbstractAdminController {
	
	@Autowired
    private ApplicationUserService applicationUserService;
	
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
        	savePhotos(applicationUser, applicationUserService, httpServletRequest.getSession().getId(), applicationUser.getFileInfos());
        } catch (ExistingUserException e) {
        	bindingResult.rejectValue("username", e.getCode(), e.getArguments(), null);
        	populateEditForm(uiModel, applicationUser);
            return "admin/applicationusers/create";
        } catch (MailException e) {
			bindingResult.rejectValue("username", messageSourceAcessor.getMessage("exception_cannot_send_email_to_address"));
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
        	ApplicationUser existingApplicationUser = applicationUserService.findApplicationUser(applicationUser.getId());
        	convertApplicationUser(applicationUser, existingApplicationUser);
        	applicationUserService.updateApplicationUser(existingApplicationUser);
        	savePhotos(applicationUser, applicationUserService, httpServletRequest.getSession().getId(), applicationUser.getFileInfos());        	
	    } catch (ExistingUserException e) {
	    	bindingResult.rejectValue("username", e.getCode(), e.getArguments(), null);
	    	populateEditForm(uiModel, applicationUser);
	        return "admin/applicationusers/update";
	    } catch (MailException e) {
			bindingResult.rejectValue("username", messageSourceAcessor.getMessage("exception_cannot_send_email_to_address"));
			populateEditForm(uiModel, applicationUser);
			return "admin/applicationusers/create";
		}
        uiModel.asMap().clear();
        return "redirect:/admin/applicationusers/" + applicationUser.getId();
    }

	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new ApplicationUser());
        return "admin/applicationusers/create";
    }

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("applicationuser", applicationUserService.findApplicationUser(id));
        uiModel.addAttribute("itemId", id);
        return "admin/applicationusers/show";
    }
	
	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, applicationUserService.findApplicationUser(id));
        return "admin/applicationusers/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ApplicationUser applicationUser = applicationUserService.findApplicationUser(id);
        applicationUserService.deleteApplicationUser(applicationUser);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/admin/applicationusers";
    }

	void addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("applicationUser_created_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("applicationUser_lastmodified_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }

	void populateEditForm(Model uiModel, ApplicationUser applicationUser) {
		
        uiModel.addAttribute("applicationUser", applicationUser);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("applicationroles", applicationRoleService.findAllApplicationRoles());
        uiModel.addAttribute("applicationusers", applicationUserService.findAllApplicationUsers());
        uiModel.addAttribute("addedFiles", new JSONSerializer().serialize(applicationUser.getFileInfos()));
        uiModel.addAttribute("sellers", sellerService.findAllEnabledSellers());
        uiModel.addAttribute("uploadedFiles", BasePhoto.toJsonArray(applicationUser.getApplicationUserPhotos(), new String[] {"id", "fileName"}));
    }
	
	private void convertApplicationUser(ApplicationUser applicationUser, ApplicationUser existingApplicationUser) {
		
		if (getActualUserDetails().isApplicationUsersAll()) {
			existingApplicationUser.setEnabled(applicationUser.getEnabled());
			existingApplicationUser.setRoles(applicationUser.getRoles());
			existingApplicationUser.setPassword(applicationUser.getPassword());
			existingApplicationUser.setSeller(applicationUser.getSeller());
		}
		existingApplicationUser.setName(applicationUser.getName());
		existingApplicationUser.setNickname(applicationUser.getNickname());
		existingApplicationUser.setPhone(applicationUser.getPhone());
		existingApplicationUser.setSurname(applicationUser.getSurname());
		existingApplicationUser.setUsername(applicationUser.getUsername());
	}
	
}