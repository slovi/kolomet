package cz.kolomet.web.pub;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.octo.captcha.service.image.ImageCaptchaService;

import cz.kolomet.dto.ResetPasswordDto;
import cz.kolomet.service.ApplicationUserService;
import cz.kolomet.service.exception.UserNotFoundException;

@RequestMapping("/public/resetpasswords")
@Controller
public class ResetPasswordController extends AbstractPublicController {

	@Autowired
	private ImageCaptchaService captchaService;
	
	@Autowired
	private ApplicationUserService applicationUserService;
	
	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(@RequestParam("email") String email, Model uiModel) {
		
		ResetPasswordDto resetPasswordDto = new ResetPasswordDto();
		resetPasswordDto.setUsername(email);
        populateEditForm(uiModel, resetPasswordDto);
        return "public/resetpasswords/create";
    }

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
	public String create(@Valid @ModelAttribute("resetPassword") ResetPasswordDto resetPassword, BindingResult bindingResult, RedirectAttributes uiModel,
			HttpServletRequest httpServletRequest) {
		if (bindingResult.hasErrors()) {
			populateEditForm(uiModel, resetPassword);
			return "public/resetpasswords/create";
		}

		if (!captchaService.validateResponseForID("reset_password_" + httpServletRequest.getSession().getId(),
				resetPassword.getCaptchaText())) {
			bindingResult.rejectValue("captchaText", "exception_incorrect_captcha");
			populateEditForm(uiModel, resetPassword);
			return "public/resetpasswords/create";
		}

		uiModel.asMap().clear();
		try {
			applicationUserService.resetPassword(resetPassword.getUsername());
			uiModel.addFlashAttribute("success", true);
		} catch (UserNotFoundException e) {
			uiModel.addFlashAttribute("success", false);
			uiModel.addFlashAttribute("username", e.getUsername());
		}
		return "redirect:/public/resetpasswords";
	}

	@RequestMapping(produces = "text/html")
	public String show(Model uiModel) {
		return "public/resetpasswords/show";
	}

	void populateEditForm(Model uiModel, ResetPasswordDto resetPassword) {
		uiModel.addAttribute("resetPassword", resetPassword);
	}

}
