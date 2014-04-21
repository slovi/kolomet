package cz.kolomet.web.admin;

import cz.kolomet.domain.RegistrationRequest;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/admin/registrationrequests")
@Controller("adminRegistrationRequestController")
@RooWebScaffold(path = "admin/registrationrequests", formBackingObject = RegistrationRequest.class, create = false)
public class RegistrationRequestController {
	
	@RequestMapping(produces = "text/html")
    public String list(Pageable pageable, Model uiModel) {
        if (pageable != null) {
        	Page<RegistrationRequest> page = registrationRequestService.findRegistrationRequestEntries(pageable);
            uiModel.addAttribute("registrationrequests", page.getContent());
            uiModel.addAttribute("maxPages", page.getTotalPages());
        } else {
            uiModel.addAttribute("registrationrequests", registrationRequestService.findAllRegistrationRequests());
        }
        addDateTimeFormatPatterns(uiModel);
        return "admin/registrationrequests/list";
    }
	
}
