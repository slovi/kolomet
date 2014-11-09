package cz.kolomet.web.pub;

import java.io.UnsupportedEncodingException;
import javax.persistence.EntityNotFoundException;
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

import com.octo.captcha.service.CaptchaServiceException;
import com.octo.captcha.service.image.ImageCaptchaService;

import cz.kolomet.domain.RegistrationRequest;
import cz.kolomet.service.ApplicationUserService;
import cz.kolomet.service.RegistrationRequestService;
import cz.kolomet.service.exception.DefaultObjectDataReadException;

@RequestMapping("/public/registrationrequests")
@Controller("publicRegistrationRequestController")
public class RegistrationRequestController extends AbstractPublicController {
	
	@Autowired
	private ImageCaptchaService captchaService; 
	
    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
    	RegistrationRequest registrationRequest = new RegistrationRequest();
    	try {
    		registrationRequest.setDefaultText();
    	} catch (DefaultObjectDataReadException e) {
    		logger.error(e.getLocalizedMessage(), e);
    	}
        populateEditForm(uiModel, registrationRequest);
        return "public/registrationrequests/create";
    }
	
	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid RegistrationRequest registrationRequest, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, registrationRequest);
            return "public/registrationrequests/create";
        }
        
        try {
	        if (!captchaService.validateResponseForID("registrationrequest_" + httpServletRequest.getSession().getId(), registrationRequest.getCaptchaText())) {
	        	bindingResult.rejectValue("captchaText", "exception_incorrect_captcha");
	        	populateEditForm(uiModel, registrationRequest);
	        	return "public/registrationrequests/create";
	        }
        } catch (CaptchaServiceException e) {
        	if (!captchaService.validateResponseForID("registrationrequest_" + httpServletRequest.getSession().getId(), registrationRequest.getCaptchaText())) {
	        	bindingResult.rejectValue("captchaText", "exception_incorrect_captcha");
	        	populateEditForm(uiModel, registrationRequest);
	        	return "public/registrationrequests/create";
	        }
        }
        
        uiModel.asMap().clear();
        registrationRequestService.saveRegistrationRequest(registrationRequest);
        return "redirect:/public/registrationrequests/" + encodeUrlPathSegment(registrationRequest.getId().toString(), httpServletRequest);
    }
	
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        return "public/registrationrequests/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        throw new EntityNotFoundException();
    }
	

	@Autowired
    RegistrationRequestService registrationRequestService;

	@Autowired
    ApplicationUserService applicationUserService;

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
