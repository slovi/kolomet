package cz.kolomet.web.admin;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cz.kolomet.domain.Producer;

@RequestMapping("/admin/producers")
@Controller
@RooWebScaffold(path = "admin/producers", formBackingObject = Producer.class)
public class ProducerController extends AbstractAdminController {
	
    @RequestMapping(produces = "text/html")
    public String list(Pageable pageable, Model uiModel) {
        if (pageable != null) {
        	Page<Producer> page = producerService.findProducerEntries(pageable);
            uiModel.addAttribute("producers", page.getContent());
            uiModel.addAttribute("maxPages", page.getTotalPages());
        } else {
            uiModel.addAttribute("producers", producerService.findAllProducers());
        }
        addDateTimeFormatPatterns(uiModel);
        return "admin/producers/list";
    }
	
}
