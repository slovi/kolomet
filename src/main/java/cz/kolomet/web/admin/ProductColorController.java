package cz.kolomet.web.admin;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.joda.time.format.DateTimeFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

import cz.kolomet.domain.codelist.ProductColor;
import cz.kolomet.service.ApplicationUserService;
import cz.kolomet.service.ProductColorService;

@RequestMapping("/admin/productcolors")
@Controller
public class ProductColorController extends AbstractAdminController {

	@RequestMapping(produces = "text/html")
	public String list(Pageable pageable, Model uiModel) {
		if (pageable != null) {
			Page<ProductColor> page = productColorService.findProductColorEntries(pageable);
			uiModel.addAttribute("productcolors", page.getContent());
			uiModel.addAttribute("maxPages", page.getTotalPages());
		} else {
			uiModel.addAttribute("productcolors", productColorService.findAllProductColors());
		}
		addDateTimeFormatPatterns(uiModel);
		return "admin/productcolors/list";
	}


	@Autowired
    ProductColorService productColorService;

	@Autowired
    ApplicationUserService applicationUserService;

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid ProductColor productColor, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, productColor);
            return "admin/productcolors/create";
        }
        uiModel.asMap().clear();
        productColorService.saveProductColor(productColor);
        return "redirect:/admin/productcolors/" + encodeUrlPathSegment(productColor.getId().toString(), httpServletRequest);
    }

	@RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new ProductColor());
        return "admin/productcolors/create";
    }

	@RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("productcolor", productColorService.findProductColor(id));
        uiModel.addAttribute("itemId", id);
        return "admin/productcolors/show";
    }

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid ProductColor productColor, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, productColor);
            return "admin/productcolors/update";
        }
        uiModel.asMap().clear();
        productColorService.updateProductColor(productColor);
        return "redirect:/admin/productcolors/" + encodeUrlPathSegment(productColor.getId().toString(), httpServletRequest);
    }

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, productColorService.findProductColor(id));
        return "admin/productcolors/update";
    }

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ProductColor productColor = productColorService.findProductColor(id);
        productColorService.deleteProductColor(productColor);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/admin/productcolors";
    }

	void addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("productColor_created_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("productColor_lastmodified_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }

	void populateEditForm(Model uiModel, ProductColor productColor) {
        uiModel.addAttribute("productColor", productColor);
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
