package cz.kolomet.web.pub;

import javax.persistence.EntityNotFoundException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.octo.captcha.service.image.ImageCaptchaService;

import cz.kolomet.domain.RegistrationRequest;
import cz.kolomet.dto.Registration;
import cz.kolomet.service.ApplicationUserService;
import cz.kolomet.service.exception.DefaultObjectDataReadException;

@RequestMapping("/public/registrations")
@Controller("publicRegistrationontroller")
public class RegistrationController extends AbstractPublicController {
	
	@Autowired
	private ImageCaptchaService captchaService; 
	
	@Autowired
	private ApplicationUserService applicationService;
	
    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
    	Registration registration = new Registratio();
    	try {
    		registrationRequest.setDefaultText();
    	} catch (DefaultObjectDataReadException e) {
    		logger.error(e.getLocalizedMessage(), e);
    	}
        populateEditForm(uiModel, registrationRequest);
        return "public/registrationrequests/create";
    }
	
	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Registration registration, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, registrationRequest);
            return "public/registrations/create";
        }
        
        if (!captchaService.validateResponseForID("registration_request_" + httpServletRequest.getSession().getId(), registrationRequest.getCaptchaText())) {
        	bindingResult.rejectValue("captchaText", "exception_incorrect_captcha");
        	return "public/registrations/create";
        }
        
        uiModel.asMap().clear();
        registrationRequestService.saveRegistrationRequest(registrationRequest);
        return "redirect:/public/registrations/" + encodeUrlPathSegment(registrationRequest.getId().toString(), httpServletRequest);
    }
	
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        return "public/registrations/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        throw new EntityNotFoundException();
    }
	
}
