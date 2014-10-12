package cz.kolomet.web.admin;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
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

import cz.kolomet.domain.Category;
import cz.kolomet.service.ApplicationUserService;
import cz.kolomet.service.CategoryService;
import cz.kolomet.service.CategoryTypeService;

@RequestMapping("/admin/categorys")
@Controller
public class CategoryController extends AbstractAdminController {
	
    @RequestMapping(produces = "text/html")
    public String list(Pageable pageable, Model uiModel) {
        if (pageable != null) {
        	Page<Category> page = categoryService.findCategoryEntries(pageable);
            uiModel.addAttribute("categorys", page.getContent());
            uiModel.addAttribute("maxPages", page.getTotalPages());
        } else {
            uiModel.addAttribute("categorys", categoryService.findAllCategorys());
        }
        addDateTimeFormatPatterns(uiModel);
        return "admin/categorys/list";
    }
	

	@Autowired
    CategoryService categoryService;

	@Autowired
    ApplicationUserService applicationUserService;

	@Autowired
    CategoryTypeService categoryTypeService;

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Category category, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, category);
            return "admin/categorys/create";
        }
        uiModel.asMap().clear();
        categoryService.saveCategory(category);
        return "redirect:/admin/categorys/" + encodeUrlPathSegment(category.getId().toString(), httpServletRequest);
    }

	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new Category());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (categoryTypeService.countAllCategoryTypes() == 0) {
            dependencies.add(new String[] { "categorytype", "admin/categorytypes" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "admin/categorys/create";
    }

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("category", categoryService.findCategory(id));
        uiModel.addAttribute("itemId", id);
        return "admin/categorys/show";
    }

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid Category category, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, category);
            return "admin/categorys/update";
        }
        uiModel.asMap().clear();
        categoryService.updateCategory(category);
        return "redirect:/admin/categorys/" + encodeUrlPathSegment(category.getId().toString(), httpServletRequest);
    }

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, categoryService.findCategory(id));
        return "admin/categorys/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Category category = categoryService.findCategory(id);
        categoryService.deleteCategory(category);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/admin/categorys";
    }

	void addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("category_created_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("category_lastmodified_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }

	void populateEditForm(Model uiModel, Category category) {
        uiModel.addAttribute("category", category);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("applicationusers", applicationUserService.findAllApplicationUsers());
        uiModel.addAttribute("categorytypes", categoryTypeService.findAllCategoryTypes());
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
