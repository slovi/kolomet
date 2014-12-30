package cz.kolomet.web.pub;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.List;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

import cz.kolomet.domain.Rate;
import cz.kolomet.domain.RateType;
import cz.kolomet.service.RateService;
import cz.kolomet.service.exception.ExistingRateException;
import cz.kolomet.util.web.ajax.AjaxResponse;

@RequestMapping("/public/rates")
@Controller
public class RateController {
	
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Rate rate, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, rate);
            return "public/rates/create";
        }
        uiModel.asMap().clear();
        try {
        	rateService.saveRate(rate);
        	return "redirect:/public/" + rate.getRateType().getId() + "/" + rate.getEntityId();
        } catch (ExistingRateException e) {
        	return null;
        }
    }
    
    protected void populateEditForm(Model uiModel, Rate rate) {
        uiModel.addAttribute("rate", rate);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("ratetypes", Arrays.asList(RateType.values()));
    }
	
	@ResponseBody
	@RequestMapping(method = RequestMethod.GET, produces = "text/json")
	public AjaxResponse get(Rate rate, HttpServletRequest request) {
		
		List<Rate> existingRates = rateService.findRate(rate.getRateType(), rate.getEntityId(), request.getRemoteAddr());
		
		return AjaxResponse.successful(existingRates);
	
	}
	

	@Autowired
    RateService rateService;

	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new Rate());
        return "public/rates/create";
    }

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("rate", rateService.findRate(id));
        uiModel.addAttribute("itemId", id);
        return "public/rates/show";
    }

	@RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("rates", rateService.findRateEntries(firstResult, sizeNo));
            float nrOfPages = (float) rateService.countAllRates() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("rates", rateService.findAllRates());
        }
        addDateTimeFormatPatterns(uiModel);
        return "public/rates/list";
    }

	void addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("rate_created_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("rate_lastmodified_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
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
