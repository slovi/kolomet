package cz.kolomet.web.admin;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

import cz.kolomet.domain.RegistrationRequest;
import cz.kolomet.service.ApplicationUserService;
import cz.kolomet.service.RegistrationRequestService;

@RequestMapping("/admin/registrationrequests")
@Controller("adminRegistrationRequestController")
public class RegistrationRequestController extends AbstractAdminController {
	
	@RequestMapping(produces = "text/html")
    public String list(@PageableDefault(sort = {"processed"}, direction = Direction.ASC, value = 10) Pageable pageable, Model uiModel) {
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
	

	@Autowired
    RegistrationRequestService registrationRequestService;

	@Autowired
    ApplicationUserService applicationUserService;

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("registrationrequest", registrationRequestService.findRegistrationRequest(id));
        uiModel.addAttribute("itemId", id);
        return "admin/registrationrequests/show";
    }

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid RegistrationRequest registrationRequest, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, registrationRequest);
            return "admin/registrationrequests/update";
        }
        uiModel.asMap().clear();
        registrationRequestService.updateRegistrationRequest(registrationRequest);
        return "redirect:/admin/registrationrequests/" + encodeUrlPathSegment(registrationRequest.getId().toString(), httpServletRequest);
    }

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, registrationRequestService.findRegistrationRequest(id));
        return "admin/registrationrequests/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        RegistrationRequest registrationRequest = registrationRequestService.findRegistrationRequest(id);
        registrationRequestService.deleteRegistrationRequest(registrationRequest);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/admin/registrationrequests";
    }

	void addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("registrationRequest_created_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("registrationRequest_lastmodified_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }

	void populateEditForm(Model uiModel, RegistrationRequest registrationRequest) {
        uiModel.addAttribute("registrationRequest", registrationRequest);
        addDateTimeFormatPatterns(uiModel);
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
