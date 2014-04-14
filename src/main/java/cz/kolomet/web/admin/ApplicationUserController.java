package cz.kolomet.web.admin;

import cz.kolomet.domain.ApplicationUser;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/applicationusers")
@Controller
@RooWebScaffold(path = "admin/applicationusers", formBackingObject = ApplicationUser.class)
public class ApplicationUserController extends AbstractAdminController {
	
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
	
}
