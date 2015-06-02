package cz.kolomet.web.admin;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
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

import cz.kolomet.service.ApplicationUserService;
import cz.kolomet.service.PagePhotoUrlService;
import cz.kolomet.service.PageService;

@RequestMapping("/admin/pages")
@Controller
public class PageController extends AbstractAdminController {
	
	@Autowired
	private PageService pageService;
	
	@Autowired
	private PagePhotoUrlService pagePhotoUrlService;
	
	@Autowired
	private ApplicationUserService applicationUserService;
	
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid cz.kolomet.domain.Page page, BindingResult bindingResult, @RequestParam(value = "stay", required = false) String stay, Model uiModel, HttpServletRequest httpServletRequest) throws IOException {
        
    	if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, page);
            return "admin/pages/create";
        }
        
    	uiModel.asMap().clear();              

    	pageService.savePage(page);
    	savePhotos(page, pagePhotoUrlService, httpServletRequest.getSession().getId(), page.getFileInfos());
    	
    	if (StringUtils.isNotEmpty(stay)) {
    		return "redirect:admin/pages/" + page.getId() + "?form";
    	} else {
    		return "redirect:admin/pages/" + page.getId().toString();
    	}
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid cz.kolomet.domain.Page page,  @RequestParam(value = "stay", required = false) String stay, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, page);
            return "admin/pages/update";
        }
        uiModel.asMap().clear();        
        
        pageService.updatePage(page);
        savePhotos(page, pagePhotoUrlService, httpServletRequest.getSession().getId(), page.getFileInfos());
        if (StringUtils.isNotEmpty(stay)) {
        	return "redirect:admin/pages/" + page.getId() + "?form";
        } else {
        	return "redirect:admin/pages/" + page.getId();
        }
    }
	
    @RequestMapping(produces = "text/html")
    public String list(Pageable pageable, Model uiModel) {
        if (pageable != null) {
        	Page<cz.kolomet.domain.Page> page = pageService.findPageEntries(pageable);
            uiModel.addAttribute("pages", page.getContent());
            uiModel.addAttribute("maxPages", page.getTotalPages());
        } else {
            uiModel.addAttribute("pages", pageService.findAllPages());
        }
        addDateTimeFormatPatterns(uiModel);
        return "admin/pages/list";
    }
    
    void populateEditForm(Model uiModel, cz.kolomet.domain.Page page) {
        uiModel.addAttribute("page", page);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("newsitemphotourls", pagePhotoUrlService.findAllPagePhotoUrls());
        uiModel.addAttribute("addedFiles", jsonSerializer.toJsonArray(page.getFileInfos()));
        uiModel.addAttribute("uploadedFiles", jsonSerializer.toJsonArray(page.getPagePhotoUrls(), new String[] {"id", "fileName"}));
    }
    
    void addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("page_created_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("page_lastmodified_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("page_pagedate_date_format", DateTimeFormat.patternForStyle("MS", LocaleContextHolder.getLocale()));
    }


	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new cz.kolomet.domain.Page());
        return "admin/pages/create";
    }

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("page", pageService.findPage(id));
        uiModel.addAttribute("itemId", id);
        return "admin/pages/show";
    }

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, pageService.findPage(id));
        return "admin/pages/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer pageNumber, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        cz.kolomet.domain.Page page = pageService.findPage(id);
        pageService.deletePage(page);
        uiModel.asMap().clear();
        return "redirect:admin/pages";
    }

}
