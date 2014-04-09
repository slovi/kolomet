// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.web.admin;

import cz.kolomet.domain.Producer;
import cz.kolomet.service.ApplicationUserService;
import cz.kolomet.service.ProducerService;
import cz.kolomet.web.admin.ProducerController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect ProducerController_Roo_Controller {
    
    @Autowired
    ProducerService ProducerController.producerService;
    
    @Autowired
    ApplicationUserService ProducerController.applicationUserService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ProducerController.create(@Valid Producer producer, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, producer);
            return "producers/create";
        }
        uiModel.asMap().clear();
        producerService.saveProducer(producer);
        return "redirect:/producers/" + encodeUrlPathSegment(producer.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ProducerController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Producer());
        return "producers/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ProducerController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("producer", producerService.findProducer(id));
        uiModel.addAttribute("itemId", id);
        return "producers/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ProducerController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("producers", producerService.findProducerEntries(firstResult, sizeNo));
            float nrOfPages = (float) producerService.countAllProducers() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("producers", producerService.findAllProducers());
        }
        addDateTimeFormatPatterns(uiModel);
        return "producers/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ProducerController.update(@Valid Producer producer, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, producer);
            return "producers/update";
        }
        uiModel.asMap().clear();
        producerService.updateProducer(producer);
        return "redirect:/producers/" + encodeUrlPathSegment(producer.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ProducerController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, producerService.findProducer(id));
        return "producers/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ProducerController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Producer producer = producerService.findProducer(id);
        producerService.deleteProducer(producer);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/producers";
    }
    
    void ProducerController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("producer_created_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("producer_lastmodified_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }
    
    void ProducerController.populateEditForm(Model uiModel, Producer producer) {
        uiModel.addAttribute("producer", producer);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("applicationusers", applicationUserService.findAllApplicationUsers());
    }
    
    String ProducerController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
