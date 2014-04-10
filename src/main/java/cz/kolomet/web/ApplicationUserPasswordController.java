package cz.kolomet.web;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cz.kolomet.dto.ApplicationUserPasswordDto;
import cz.kolomet.repository.ApplicationUserRepository;
import cz.kolomet.service.ApplicationUserService;
import cz.kolomet.web.admin.AbstractAdminController;

@RequestMapping("/private/password/**")
@Controller
public class ApplicationUserPasswordController extends AbstractAdminController {

	@Autowired
	private ApplicationUserService applicationUserService;
	
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid ApplicationUserPasswordDto password, BindingResult bindingResult, RedirectAttributes redirectAttributes, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(redirectAttributes, new ApplicationUserPasswordDto());
            return "admin/photourls/update";
        }
        
        password.setUsername(getUsername());        
        applicationUserService.updatePassword(password);
        
        redirectAttributes.asMap().clear();
        redirectAttributes.addFlashAttribute("password_ok", "password_ok");
        return "redirect:/private/password";
    }

    @RequestMapping(params = "form", produces = "text/html")
    public String updateForm(Model uiModel) {
        populateEditForm(uiModel, new ApplicationUserPasswordDto());
        return "admin/photourls/update";
    }
    
    void populateEditForm(Model uiModel, ApplicationUserPasswordDto applicationUserPassword) {
        uiModel.addAttribute("password", applicationUserPassword);
    }
}
