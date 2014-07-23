package cz.kolomet.web.admin;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cz.kolomet.domain.PhotoUrl;
import cz.kolomet.domain.Product;
import cz.kolomet.service.PhotoUrlService;
import cz.kolomet.service.ProductService;

@RequestMapping("/admin/photourls")
@Controller
@RooWebScaffold(path = "admin/photourls", formBackingObject = PhotoUrl.class, update = false)
public class PhotoUrlController extends AbstractAdminController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private PhotoUrlService photoUrlService;
	
    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel, @RequestParam(value = "parentEntityId", required = false) Long parentEntityId) {
    	Product product = parentEntityId != null ? productService.findProduct(parentEntityId) : null;
        populateEditForm(uiModel, new PhotoUrl(), product);
        List<String[]> dependencies = new ArrayList<String[]>();
        if (productService.countAllProducts() == 0) {
            dependencies.add(new String[] { "product", "products" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "admin/photourls/create";
    }
	
	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
	public String create(@Valid PhotoUrl photoUrl, BindingResult bindingResult, Model model, HttpServletRequest httpServletRequest) {
		
		if (bindingResult.hasErrors()) {
			populateEditForm(model, photoUrl, null);
	        return "admin/photourls/update";
		}
		
		model.asMap().clear();
		savePhotos(photoUrl.getProduct(), photoUrlService, photoUrl.getContents());
		return "redirect:/admin/products/" + photoUrl.getProduct().getId() + "?form";
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        PhotoUrl photoUrl = photoUrlService.findPhotoUrl(id);
        photoUrlService.deletePhotoUrl(photoUrl);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/admin/products/" + photoUrl.getProduct().getId() + "?form";
    }
	
	void populateEditForm(Model uiModel, PhotoUrl photoUrl, Product product) {
		if (product != null) {
			photoUrl.setProduct(product);
		}
        uiModel.addAttribute("photoUrl", photoUrl);
    }
	
}
