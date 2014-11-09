package cz.kolomet.web.pub;

import javax.persistence.EntityNotFoundException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.mail.MailException;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.octo.captcha.service.CaptchaServiceException;
import com.octo.captcha.service.image.ImageCaptchaService;

import cz.kolomet.domain.AddressType;
import cz.kolomet.domain.ApplicationUser;
import cz.kolomet.domain.ApplicationUserAddress;
import cz.kolomet.dto.ApplicationUserRegistration;
import cz.kolomet.service.ApplicationRoleService;
import cz.kolomet.service.ApplicationUserService;
import cz.kolomet.service.CountryStateService;
import cz.kolomet.service.exception.ExistingUserException;
import cz.kolomet.util.web.ajax.AjaxResponse;
import flexjson.JSONSerializer;

@Controller
@RequestMapping("/public/applicationuserregistrations")
public class ApplicationUserRegistrationController extends AbstractPublicController {
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private ImageCaptchaService captchaService; 
	
	@Autowired
	private ApplicationUserService applicationUserService;
	
	@Autowired
	private ApplicationRoleService applicationRoleService;
	
	@Autowired
	private CountryStateService countryStateService;
	
	@RequestMapping(params = "token")
	public String activeAccount(@RequestParam(value = "token", required = true) String token, RedirectAttributes redirectAttributes) {
		
		applicationUserService.activateApplicationUser(token);
		redirectAttributes.addFlashAttribute("registrationSuccess", true);		
		return "redirect:public/places";
	}
	
    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
    	ApplicationUserRegistration registration = new ApplicationUserRegistration();
        populateEditForm(uiModel, registration);
        return "public/applicationuserregistrations/create";
    }
    
    @ResponseBody
    @RequestMapping(method = RequestMethod.POST, value = "/file", produces = {"text/plain", "application/json"})
    public AjaxResponse savePhoto(@RequestParam("content") MultipartFile content, HttpServletRequest request, HttpServletResponse response) throws Exception {
    	saveFile(applicationUserService, content, request.getSession().getId());
    	return AjaxResponse.emptySuccessul();
    }
	
	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid ApplicationUserRegistration applicationUserRegistration, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, applicationUserRegistration);
            return "public/applicationuserregistrations/create";
        }
        
        if (!applicationUserRegistration.getConditionAgreement()) {
        	bindingResult.rejectValue("conditionAgreement", "exception_unagreed_conditions");
        	populateEditForm(uiModel, applicationUserRegistration);
        	return "public/applicationuserregistrations/create";
        }
        
        if (!applicationUserRegistration.getPrivateAgreement()) {
        	bindingResult.rejectValue("privateAgreement", "exception_unagreed_private");
        	populateEditForm(uiModel, applicationUserRegistration);
        	return "public/applicationuserregistrations/create";
        }
        
        if (!applicationUserRegistration.samePasswordValues()) {
        	bindingResult.rejectValue("password", "exception_password_not_same");
        	populateEditForm(uiModel, applicationUserRegistration);
        	return "public/applicationuserregistrations/create";
        }
        
        try {
	        if (!captchaService.validateResponseForID("applicationuserregistration_" + httpServletRequest.getSession().getId(), applicationUserRegistration.getCaptchaText())) {
	        	bindingResult.rejectValue("captchaText", "exception_incorrect_captcha");
	        	populateEditForm(uiModel, applicationUserRegistration);
	        	return "public/applicationuserregistrations/create";
	        }
        } catch (CaptchaServiceException e) {
        	bindingResult.rejectValue("captchaText", "exception_incorrect_captcha");
        	populateEditForm(uiModel, applicationUserRegistration);
        	return "public/applicationuserregistrations/create";
        }

        ApplicationUserAddress address = new ApplicationUserAddress();
        address.setCity(applicationUserRegistration.getCity());
        address.setStreet(applicationUserRegistration.getStreet());
        address.setHouseNr(applicationUserRegistration.getHouseNr());
        address.setCountryState(applicationUserRegistration.getCountryState());
        address.setPostCode(applicationUserRegistration.getPostCode());
        address.setAddressType(AddressType.PERMANENT);
        
		ApplicationUser applicationUser = new ApplicationUser();
		applicationUser.setEnabled(false);
		applicationUser.setPassword(passwordEncoder.encodePassword(applicationUserRegistration.getPassword(), null));
		applicationUser.setName(applicationUserRegistration.getName());
		applicationUser.setUsername(applicationUserRegistration.getUsername());		
		applicationUser.setNickname(applicationUserRegistration.getNickname());
		applicationUser.setSurname(applicationUserRegistration.getSurname());
		applicationUser.addRole(applicationRoleService.findApplicationRole("role_user"));
		applicationUser.addAddress(address);
		
		try {
			applicationUserService.registerApplicationUser(applicationUser);
			savePhotos(applicationUser, applicationUserService, httpServletRequest.getSession().getId(), applicationUserRegistration.getFileInfos());
			uiModel.asMap().clear();
			return "redirect:public/applicationuserregistrations/" + applicationUser.getId();
		} catch (ExistingUserException e) {
			bindingResult.rejectValue("username", "exception_bad_username", new Object[] {applicationUser.getUsername()}, "");
			populateEditForm(uiModel, applicationUserRegistration);
			return "public/applicationuserregistrations/create";
		} catch (MailException e) {
			logger.error(e, e);
			bindingResult.rejectValue("username", "exception_cannot_send_email_to_client_address");
			populateEditForm(uiModel, applicationUserRegistration);
			return "public/applicationuserregistrations/create";
		}
    }
	
    public void addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("registrationRequest_created_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("registrationRequest_lastmodified_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }
	
    public void populateEditForm(Model uiModel, ApplicationUserRegistration applicationUserRegistration) {
    	applicationUserRegistration.clearCaptchaText();
        uiModel.addAttribute("applicationUserRegistration", applicationUserRegistration);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("applicationusers", applicationUserService.findAllApplicationUsers());
        uiModel.addAttribute("addedFiles", new JSONSerializer().serialize(applicationUserRegistration.getFileInfos()));
        uiModel.addAttribute("countryStates", countryStateService.findAllCountryStates());
    }
	
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        return "public/applicationuserregistrations/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        throw new EntityNotFoundException();
    }
	
}
