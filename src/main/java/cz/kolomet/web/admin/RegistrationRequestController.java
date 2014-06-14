package cz.kolomet.web.admin;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefaults;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cz.kolomet.domain.RegistrationRequest;

@RequestMapping("/admin/registrationrequests")
@Controller("adminRegistrationRequestController")
@RooWebScaffold(path = "admin/registrationrequests", formBackingObject = RegistrationRequest.class, create = false)
public class RegistrationRequestController extends AbstractAdminController {
	
	@RequestMapping(produces = "text/html")
    public String list(@PageableDefaults(sort = {"processed"}, sortDir = Direction.ASC, value = 10) Pageable pageable, Model uiModel) {
        if (pageable != null) {
        	Sort usedSort = pageable.getSort().and(new Sort(Direction.DESC, "created"));
        	Pageable usedPageable = new PageRequest(pageable.getPageNumber(), pageable.getPageSize(), usedSort);
        	Page<RegistrationRequest> page = registrationRequestService.findRegistrationRequestEntries(usedPageable);
            uiModel.addAttribute("registrationrequests", page.getContent());
            uiModel.addAttribute("maxPages", page.getTotalPages());
        } else {
            uiModel.addAttribute("registrationrequests", registrationRequestService.findAllRegistrationRequests());
        }
        addDateTimeFormatPatterns(uiModel);
        return "admin/registrationrequests/list";
    }
	
}
