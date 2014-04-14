package cz.kolomet.web;

import cz.kolomet.domain.codelist.FigureHeight;
import cz.kolomet.web.admin.AbstractAdminController;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/admin/figureheights")
@Controller
@RooWebScaffold(path = "admin/figureheights", formBackingObject = FigureHeight.class)
public class FigureHeightController extends AbstractAdminController {
	
    @RequestMapping(produces = "text/html")
    public String list(Pageable pageable, Model uiModel) {
        if (pageable != null) {
        	Page<FigureHeight> page = figureHeightService.findFigureHeightEntries(pageable);
            uiModel.addAttribute("figureheights", page.getContent());
            uiModel.addAttribute("maxPages", page.getTotalPages());
        } else {
            uiModel.addAttribute("figureheights", figureHeightService.findAllFigureHeights());
        }
        addDateTimeFormatPatterns(uiModel);
        return "admin/figureheights/list";
    }
	
}
