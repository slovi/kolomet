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
import cz.kolomet.service.ApplicationUserService;
import cz.kolomet.web.admin.AbstractAdminController;

@RequestMapping("/admin/password/**")
@Controller
public class ApplicationUserPasswordController extends AbstractAdminController {

	@Autowired
	private ApplicationUserService applicationUserService;
	
	@RequestMapping("show")
	public String show(RedirectAttributes redirectAttributes) {
		return "admin/password/show";
	}
	
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid ApplicationUserPasswordDto password, BindingResult bindingResult, RedirectAttributes redirectAttributes, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(redirectAttributes, new ApplicationUserPasswordDto());
            return "admin/password/update";
        }
        
        password.setUsername(getUsername());        
        applicationUserService.updatePassword(password);
        
        redirectAttributes.asMap().clear();
        redirectAttributes.addFlashAttribute("password", password);
        return "redirect:/admin/password/show";
    }

    @RequestMapping(params = "form", produces = "text/html")
    public String updateForm(Model uiModel) {
        populateEditForm(uiModel, new ApplicationUserPasswordDto());
        return "admin/password/update";
    }
    
    void populateEditForm(Model uiModel, ApplicationUserPasswordDto applicationUserPassword) {
        uiModel.addAttribute("password", applicationUserPassword);
    }

}
