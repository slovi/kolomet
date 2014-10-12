package cz.kolomet.web.admin;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

import cz.kolomet.domain.ApplicationRole;
import cz.kolomet.service.ApplicationPermissionService;
import cz.kolomet.service.ApplicationRoleService;
import cz.kolomet.service.ApplicationUserService;

@RequestMapping("/admin/applicationroles")
@Controller
public class ApplicationRoleController extends AbstractAdminController {

	@Autowired
    ApplicationRoleService applicationRoleService;

	@Autowired
    ApplicationPermissionService applicationPermissionService;

	@Autowired
    ApplicationUserService applicationUserService;

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid ApplicationRole applicationRole, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, applicationRole);
            return "admin/applicationroles/create";
        }
        uiModel.asMap().clear();
        applicationRoleService.saveApplicationRole(applicationRole);
        return "redirect:/admin/applicationroles/" + encodeUrlPathSegment(applicationRole.getId().toString(), httpServletRequest);
    }

	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new ApplicationRole());
        return "admin/applicationroles/create";
    }

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("applicationrole", applicationRoleService.findApplicationRole(id));
        uiModel.addAttribute("itemId", id);
        return "admin/applicationroles/show";
    }

	@RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("applicationroles", applicationRoleService.findApplicationRoleEntries(firstResult, sizeNo));
            float nrOfPages = (float) applicationRoleService.countAllApplicationRoles() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("applicationroles", applicationRoleService.findAllApplicationRoles());
        }
        addDateTimeFormatPatterns(uiModel);
        return "admin/applicationroles/list";
    }

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid ApplicationRole applicationRole, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, applicationRole);
            return "admin/applicationroles/update";
        }
        uiModel.asMap().clear();
        applicationRoleService.updateApplicationRole(applicationRole);
        return "redirect:/admin/applicationroles/" + encodeUrlPathSegment(applicationRole.getId().toString(), httpServletRequest);
    }

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, applicationRoleService.findApplicationRole(id));
        return "admin/applicationroles/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ApplicationRole applicationRole = applicationRoleService.findApplicationRole(id);
        applicationRoleService.deleteApplicationRole(applicationRole);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/admin/applicationroles";
    }

	void addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("applicationRole_created_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("applicationRole_lastmodified_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }

	void populateEditForm(Model uiModel, ApplicationRole applicationRole) {
        uiModel.addAttribute("applicationRole", applicationRole);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("applicationpermissions", applicationPermissionService.findAllApplicationPermissions());
        uiModel.addAttribute("applicationusers", applicationUserService.findAllApplicationUsers());
    }

	String encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
