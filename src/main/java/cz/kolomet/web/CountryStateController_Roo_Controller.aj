// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.web;

import cz.kolomet.domain.codelist.CountryState;
import cz.kolomet.service.CountryStateService;
import cz.kolomet.web.CountryStateController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect CountryStateController_Roo_Controller {
    
    @Autowired
    CountryStateService CountryStateController.countryStateService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String CountryStateController.create(@Valid CountryState countryState, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, countryState);
            return "countrystates/create";
        }
        uiModel.asMap().clear();
        countryStateService.saveCountryState(countryState);
        return "redirect:/countrystates/" + encodeUrlPathSegment(countryState.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String CountryStateController.createForm(Model uiModel) {
        populateEditForm(uiModel, new CountryState());
        return "countrystates/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String CountryStateController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("countrystate", countryStateService.findCountryState(id));
        uiModel.addAttribute("itemId", id);
        return "countrystates/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String CountryStateController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("countrystates", countryStateService.findCountryStateEntries(firstResult, sizeNo));
            float nrOfPages = (float) countryStateService.countAllCountryStates() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("countrystates", countryStateService.findAllCountryStates());
        }
        return "countrystates/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String CountryStateController.update(@Valid CountryState countryState, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, countryState);
            return "countrystates/update";
        }
        uiModel.asMap().clear();
        countryStateService.updateCountryState(countryState);
        return "redirect:/countrystates/" + encodeUrlPathSegment(countryState.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String CountryStateController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, countryStateService.findCountryState(id));
        return "countrystates/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String CountryStateController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        CountryState countryState = countryStateService.findCountryState(id);
        countryStateService.deleteCountryState(countryState);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/countrystates";
    }
    
    void CountryStateController.populateEditForm(Model uiModel, CountryState countryState) {
        uiModel.addAttribute("countryState", countryState);
    }
    
    String CountryStateController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
