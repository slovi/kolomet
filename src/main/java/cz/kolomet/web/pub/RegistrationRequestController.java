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
import cz.kolomet.web.AbstractController;

@RequestMapping("/public/registrationrequests")
@Controller("publicRegistrationRequestController")
@RooWebScaffold(path = "public/registrationrequests", formBackingObject = RegistrationRequest.class, update = false, delete = false)
public class RegistrationRequestController extends AbstractController {
	
	@Autowired
	private ImageCaptchaService captchaService; 
	
	
	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid RegistrationRequest registrationRequest, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, registrationRequest);
            return "public/registrationrequests/create";
        }
        
        if (!captchaService.validateResponseForID(httpServletRequest.getSession().getId(), registrationRequest.getCaptchaText())) {
        	bindingResult.rejectValue("captchaText", "Opsal jste spatne kod z obrazku");
        	return "public/registrationrequests/create";
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
	
}