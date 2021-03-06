package cz.kolomet.web.admin;

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

import cz.kolomet.domain.codelist.ProductAttributeType;
import cz.kolomet.service.ApplicationUserService;
import cz.kolomet.service.CategoryTypeService;
import cz.kolomet.service.ProductAttributeTypeService;

@RequestMapping("/admin/productattributetypes")
@Controller
public class ProductAttributeTypeController extends AbstractAdminController {
	
	@RequestMapping(produces = "text/html")
    public String list(Pageable pageable, Model uiModel) {
        if (pageable != null) {
        	Page<ProductAttributeType> page = productAttributeTypeService.findProductAttributeTypeEntries(pageable);
            uiModel.addAttribute("productattributetypes", page.getContent());
            uiModel.addAttribute("maxPages", page.getTotalPages());
        } else {
            uiModel.addAttribute("productattributetypes", productAttributeTypeService.findAllProductAttributeTypes());
        }
        addDateTimeFormatPatterns(uiModel);
        return "admin/productattributetypes/list";
    }
	

	@Autowired
    ProductAttributeTypeService productAttributeTypeService;

	@Autowired
    ApplicationUserService applicationUserService;

	@Autowired
    CategoryTypeService categoryTypeService;

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid ProductAttributeType productAttributeType, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, productAttributeType);
            return "admin/productattributetypes/create";
        }
        uiModel.asMap().clear();
        productAttributeTypeService.saveProductAttributeType(productAttributeType);
        return "redirect:/admin/productattributetypes/" + encodeUrlPathSegment(productAttributeType.getId().toString(), httpServletRequest);
    }

	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new ProductAttributeType());
        return "admin/productattributetypes/create";
    }

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("productattributetype", productAttributeTypeService.findProductAttributeType(id));
        uiModel.addAttribute("itemId", id);
        return "admin/productattributetypes/show";
    }

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid ProductAttributeType productAttributeType, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, productAttributeType);
            return "admin/productattributetypes/update";
        }
        uiModel.asMap().clear();
        productAttributeTypeService.updateProductAttributeType(productAttributeType);
        return "redirect:/admin/productattributetypes/" + encodeUrlPathSegment(productAttributeType.getId().toString(), httpServletRequest);
    }

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, productAttributeTypeService.findProductAttributeType(id));
        return "admin/productattributetypes/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ProductAttributeType productAttributeType = productAttributeTypeService.findProductAttributeType(id);
        productAttributeTypeService.deleteProductAttributeType(productAttributeType);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/admin/productattributetypes";
    }

	void addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("productAttributeType_created_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("productAttributeType_lastmodified_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }

	void populateEditForm(Model uiModel, ProductAttributeType productAttributeType) {
        uiModel.addAttribute("productAttributeType", productAttributeType);
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
