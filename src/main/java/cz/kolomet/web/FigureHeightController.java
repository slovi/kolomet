package cz.kolomet.web;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

import cz.kolomet.domain.codelist.FigureHeight;
import cz.kolomet.service.ApplicationUserService;
import cz.kolomet.service.FigureHeightService;
import cz.kolomet.web.admin.AbstractAdminController;

@RequestMapping("/admin/figureheights")
@Controller
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
	

	@Autowired
    FigureHeightService figureHeightService;

	@Autowired
    ApplicationUserService applicationUserService;

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid FigureHeight figureHeight, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, figureHeight);
            return "admin/figureheights/create";
        }
        uiModel.asMap().clear();
        figureHeightService.saveFigureHeight(figureHeight);
        return "redirect:/admin/figureheights/" + encodeUrlPathSegment(figureHeight.getId().toString(), httpServletRequest);
    }

	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new FigureHeight());
        return "admin/figureheights/create";
    }

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("figureheight", figureHeightService.findFigureHeight(id));
        uiModel.addAttribute("itemId", id);
        return "admin/figureheights/show";
    }

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid FigureHeight figureHeight, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, figureHeight);
            return "admin/figureheights/update";
        }
        uiModel.asMap().clear();
        figureHeightService.updateFigureHeight(figureHeight);
        return "redirect:/admin/figureheights/" + encodeUrlPathSegment(figureHeight.getId().toString(), httpServletRequest);
    }

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, figureHeightService.findFigureHeight(id));
        return "admin/figureheights/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        FigureHeight figureHeight = figureHeightService.findFigureHeight(id);
        figureHeightService.deleteFigureHeight(figureHeight);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/admin/figureheights";
    }

	void addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("figureHeight_created_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("figureHeight_lastmodified_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }

	void populateEditForm(Model uiModel, FigureHeight figureHeight) {
        uiModel.addAttribute("figureHeight", figureHeight);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("applicationusers", applicationUserService.findAllApplicationUsers());
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
