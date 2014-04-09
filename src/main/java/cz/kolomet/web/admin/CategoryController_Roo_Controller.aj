// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package cz.kolomet.web.admin;

import cz.kolomet.domain.Category;
import cz.kolomet.domain.codelist.CategoryType;
import cz.kolomet.service.ApplicationUserService;
import cz.kolomet.service.CategoryService;
import cz.kolomet.service.CategoryTypeService;
import cz.kolomet.web.admin.CategoryController;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
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

privileged aspect CategoryController_Roo_Controller {
    
    @Autowired
    CategoryService CategoryController.categoryService;
    
    @Autowired
    ApplicationUserService CategoryController.applicationUserService;
    
    @Autowired
    CategoryTypeService CategoryController.categoryTypeService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String CategoryController.create(@Valid Category category, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, category);
            return "categorys/create";
        }
        uiModel.asMap().clear();
        categoryService.saveCategory(category);
        return "redirect:/categorys/" + encodeUrlPathSegment(category.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String CategoryController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Category());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (categoryTypeService.countAllCategoryTypes() == 0) {
            dependencies.add(new String[] { "categorytype", "categorytypes" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "categorys/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String CategoryController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("category", categoryService.findCategory(id));
        uiModel.addAttribute("itemId", id);
        return "categorys/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String CategoryController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("categorys", categoryService.findCategoryEntries(firstResult, sizeNo));
            float nrOfPages = (float) categoryService.countAllCategorys() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("categorys", categoryService.findAllCategorys());
        }
        addDateTimeFormatPatterns(uiModel);
        return "categorys/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String CategoryController.update(@Valid Category category, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, category);
            return "categorys/update";
        }
        uiModel.asMap().clear();
        categoryService.updateCategory(category);
        return "redirect:/categorys/" + encodeUrlPathSegment(category.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String CategoryController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, categoryService.findCategory(id));
        return "categorys/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String CategoryController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Category category = categoryService.findCategory(id);
        categoryService.deleteCategory(category);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/categorys";
    }
    
    void CategoryController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("category_created_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("category_lastmodified_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }
    
    void CategoryController.populateEditForm(Model uiModel, Category category) {
        uiModel.addAttribute("category", category);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("applicationusers", applicationUserService.findAllApplicationUsers());
        uiModel.addAttribute("categorytypes", categoryTypeService.findAllCategoryTypes());
    }
    
    String CategoryController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
