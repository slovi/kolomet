package cz.kolomet.web.admin;

import cz.kolomet.domain.ApplicationPermission;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/applicationpermissions")
@Controller
@RooWebScaffold(path = "admin/applicationpermissions", formBackingObject = ApplicationPermission.class)
public class ApplicationPermissionController extends AbstractAdminController {
	
    @RequestMapping(produces = "text/html")
    public String list(Pageable pageable, Model uiModel) {
        if (pageable != null) {
        	Page<ApplicationPermission> page = applicationPermissionService.findApplicationPermissionEntries(pageable);
            uiModel.addAttribute("applicationpermissions", page.getContent());
            uiModel.addAttribute("maxPages", page.getTotalPages());
        } else {
            uiModel.addAttribute("applicationpermissions", applicationPermissionService.findAllApplicationPermissions());
        }
        addDateTimeFormatPatterns(uiModel);
        return "admin/applicationpermissions/list";
    }
	
}
