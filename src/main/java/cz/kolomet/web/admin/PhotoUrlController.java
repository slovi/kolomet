package cz.kolomet.web.admin;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import cz.kolomet.domain.PhotoUrl;
import cz.kolomet.domain.Product;
import cz.kolomet.service.ProductService;

@RequestMapping("/photourls")
@Controller
@RooWebScaffold(path = "photourls", formBackingObject = PhotoUrl.class)
public class PhotoUrlController extends AbstractAdminController {
	
	@Value("${product.img.rootdir}")
	private String rootDir;
	
	@Autowired
	private ProductService productService;
	
    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel, @RequestParam(value = "parentEntityId", required = false) Long parentEntityId) {
    	Product product = parentEntityId != null ? productService.findProduct(parentEntityId) : null;
        populateEditForm(uiModel, new PhotoUrl(), product);
        List<String[]> dependencies = new ArrayList<String[]>();
        if (productService.countAllProducts() == 0) {
            dependencies.add(new String[] { "product", "products" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "photourls/create";
    }

    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, @RequestParam(value = "parentEntityId", required = false) Long parentEntityId, Model uiModel) {
    	Product product = parentEntityId != null ? productService.findProduct(parentEntityId) : null;
        populateEditForm(uiModel, photoUrlService.findPhotoUrl(id), product);
        return "photourls/update";
    }
	
	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
	public String create(@Valid PhotoUrl photoUrl, BindingResult bindingResult, Model model,
	       @RequestParam("content") CommonsMultipartFile content,
	       HttpServletRequest httpServletRequest) {
		
		if (bindingResult.hasErrors()) {
			populateEditForm(model, photoUrl, null);
	        return "photourls/update";
		}
		
		File dest = getDestFile(photoUrl, content);
		try {
			content.transferTo(dest);
			photoUrl.setFileName(dest.getName());
			photoUrl.setContentType(content.getContentType());
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		photoUrlService.savePhotoUrl(photoUrl, dest, new File(rootDir, photoUrl.getProduct().getId().toString()));
		return "redirect:/products/" + encodeUrlPathSegment(photoUrl.getProduct().getId().toString(), httpServletRequest);
	}
	
	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid PhotoUrl photoUrl, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, photoUrl, null);
            return "photourls/update";
        }
        uiModel.asMap().clear();
        photoUrlService.updatePhotoUrl(photoUrl);
        return "redirect:/products/" + encodeUrlPathSegment(photoUrl.getProduct().getId().toString(), httpServletRequest);
    }
	
	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        PhotoUrl photoUrl = photoUrlService.findPhotoUrl(id);
        photoUrlService.deletePhotoUrl(photoUrl);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/products/" + photoUrl.getProduct().getId();
    }
	
	void populateEditForm(Model uiModel, PhotoUrl photoUrl, Product product) {
		if (product != null) {
			photoUrl.setProduct(product);
		}
        uiModel.addAttribute("photoUrl", photoUrl);
        uiModel.addAttribute("products", productService.findAllProducts());
    }
	
	private File getDestFile(PhotoUrl photoUrl, CommonsMultipartFile content) {
		File parent = new File(rootDir + "/" + photoUrl.getProduct().getId());
		try {
			FileUtils.forceMkdir(parent);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		File dest = new File(parent, content.getOriginalFilename());
		return dest;
	}
	
}
