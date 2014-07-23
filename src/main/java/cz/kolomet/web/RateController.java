package cz.kolomet.web;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cz.kolomet.domain.Rate;
import cz.kolomet.domain.RateType;
import cz.kolomet.util.web.ajax.AjaxResponse;

@RequestMapping("/public/rates")
@Controller
@RooWebScaffold(path = "public/rates", formBackingObject = Rate.class, update = false, delete = false, create = true)
public class RateController {
	
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Rate rate, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, rate);
            return "public/rates/create";
        }
        uiModel.asMap().clear();
        rateService.saveRate(rate);
        return "redirect:/public/" + rate.getRateType().getId() + "/" + rate.getEntityId();
    }
    
    protected void populateEditForm(Model uiModel, Rate rate) {
        uiModel.addAttribute("rate", rate);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("ratetypes", Arrays.asList(RateType.values()));
    }
	
	@ResponseBody
	@RequestMapping(method = RequestMethod.GET, produces = "text/json")
	public AjaxResponse get(Rate rate, HttpServletRequest request) {
		
		Rate existingRate = rateService.findRate(rate.getRateType(), rate.getEntityId(), request.getRemoteAddr());
		
		return new AjaxResponse(existingRate);
	
	}
	
}
