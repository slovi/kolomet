// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.web.admin;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

import cz.kolomet.domain.ApplicationUser;
import cz.kolomet.service.ApplicationUserService;

privileged aspect ApplicationUserController_Roo_Controller {
    
    @Autowired
    ApplicationUserService ApplicationUserController.applicationUserService;
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ApplicationUserController.createForm(Model uiModel) {
        populateEditForm(uiModel, new ApplicationUser());
        return "admin/applicationusers/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ApplicationUserController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("applicationuser", applicationUserService.findApplicationUser(id));
        uiModel.addAttribute("itemId", id);
        return "admin/applicationusers/show";
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ApplicationUserController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, applicationUserService.findApplicationUser(id));
        return "admin/applicationusers/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ApplicationUserController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ApplicationUser applicationUser = applicationUserService.findApplicationUser(id);
        applicationUserService.deleteApplicationUser(applicationUser);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/admin/applicationusers";
    }
    
    void ApplicationUserController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("applicationUser_created_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("applicationUser_lastmodified_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }
    
    void ApplicationUserController.populateEditForm(Model uiModel, ApplicationUser applicationUser) {
        uiModel.addAttribute("applicationUser", applicationUser);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("applicationroles", applicationRoleService.findAllApplicationRoles());
        uiModel.addAttribute("applicationusers", applicationUserService.findAllApplicationUsers());
        uiModel.addAttribute("sellers", sellerService.findAllSellers());
    }
    
    String ApplicationUserController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
