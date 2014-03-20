// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.web;

import cz.kolomet.domain.ApplicationUser;
import cz.kolomet.service.ApplicationUserService;
import cz.kolomet.service.SellerService;
import cz.kolomet.web.ApplicationUserController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect ApplicationUserController_Roo_Controller {
    
    @Autowired
    ApplicationUserService ApplicationUserController.applicationUserService;
    
    @Autowired
    SellerService ApplicationUserController.sellerService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ApplicationUserController.create(@Valid ApplicationUser applicationUser, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, applicationUser);
            return "applicationusers/create";
        }
        uiModel.asMap().clear();
        applicationUserService.saveApplicationUser(applicationUser);
        return "redirect:/applicationusers/" + encodeUrlPathSegment(applicationUser.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ApplicationUserController.createForm(Model uiModel) {
        populateEditForm(uiModel, new ApplicationUser());
        return "applicationusers/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ApplicationUserController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("applicationuser", applicationUserService.findApplicationUser(id));
        uiModel.addAttribute("itemId", id);
        return "applicationusers/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ApplicationUserController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("applicationusers", applicationUserService.findApplicationUserEntries(firstResult, sizeNo));
            float nrOfPages = (float) applicationUserService.countAllApplicationUsers() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("applicationusers", applicationUserService.findAllApplicationUsers());
        }
        return "applicationusers/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ApplicationUserController.update(@Valid ApplicationUser applicationUser, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, applicationUser);
            return "applicationusers/update";
        }
        uiModel.asMap().clear();
        applicationUserService.updateApplicationUser(applicationUser);
        return "redirect:/applicationusers/" + encodeUrlPathSegment(applicationUser.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ApplicationUserController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, applicationUserService.findApplicationUser(id));
        return "applicationusers/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ApplicationUserController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ApplicationUser applicationUser = applicationUserService.findApplicationUser(id);
        applicationUserService.deleteApplicationUser(applicationUser);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/applicationusers";
    }
    
    void ApplicationUserController.populateEditForm(Model uiModel, ApplicationUser applicationUser) {
        uiModel.addAttribute("applicationUser", applicationUser);
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
