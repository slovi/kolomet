package cz.kolomet.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cz.kolomet.domain.Seller;
import cz.kolomet.domain.SellerPhotoUrl;
import cz.kolomet.service.SellerService;
import cz.kolomet.web.admin.AbstractAdminController;

@RequestMapping("/admin/sellerphotourls")
@Controller
@RooWebScaffold(path = "admin/sellerphotourls", formBackingObject = SellerPhotoUrl.class, update = false)
public class SellerPhotoUrlController extends AbstractAdminController {
	
	@Autowired
	private SellerService sellerService;
	
    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel, @RequestParam(value = "parentEntityId", required = false) Long parentEntityId) {
    	Seller seller = parentEntityId != null ? sellerService.findSeller(parentEntityId) : null;
        populateEditForm(uiModel, new SellerPhotoUrl(), seller);
        List<String[]> dependencies = new ArrayList<String[]>();
        if (sellerService.countAllSellers() == 0) {
            dependencies.add(new String[] { "seller", "sellers" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "admin/sellerphotourls/create";
    }
    
	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(SellerPhotoUrl sellerPhotoUrl, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {

		if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, sellerPhotoUrl, null);
            return "admin/sellerphotourls/create";
        }
        uiModel.asMap().clear();
        saveSellerPhotos(sellerPhotoUrl.getSeller(), sellerPhotoUrl.getContents());
        return "redirect:/admin/sellers/" + sellerPhotoUrl.getSeller().getId();
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        SellerPhotoUrl sellerPhotoUrl = sellerPhotoUrlService.findSellerPhotoUrl(id);
        sellerPhotoUrlService.deleteSellerPhotoUrl(sellerPhotoUrl);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/admin/sellers/" + sellerPhotoUrl.getSeller().getId();
    }
    
    void populateEditForm(Model uiModel, SellerPhotoUrl sellerPhotoUrl, Seller seller) {
    	if (seller != null) {
			sellerPhotoUrl.setSeller(seller);
		}
        uiModel.addAttribute("sellerPhotoUrl", sellerPhotoUrl);
        uiModel.addAttribute("sellers", sellerService.findAllSellers());
    }

}
