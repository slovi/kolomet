package cz.kolomet.web.admin;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cz.kolomet.domain.Seller;
import cz.kolomet.security.ApplicationUserDetails;

@RequestMapping("/admin/sellers")
@Controller
@RooWebScaffold(path = "admin/sellers", formBackingObject = Seller.class)
public class SellerController extends AbstractAdminController {
	
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid Seller seller, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, seller);
            return "admin/sellers/update";
        }
        uiModel.asMap().clear();
        
        if (ApplicationUserDetails.getActualApplicationUserDetails().isSellersOwn()) {
        	// reset values which seller cannot override
        	Seller actualSeller = sellerService.findSeller(seller.getId());
        	seller.setSellerStatus(actualSeller.getSellerStatus());
        	seller.setEnabled(actualSeller.getEnabled());
        }
        
        sellerService.updateSeller(seller);
        return "redirect:/admin/sellers/" + encodeUrlPathSegment(seller.getId().toString(), httpServletRequest);
    }
	
    @RequestMapping(produces = "text/html")
    public String list(Pageable pageable, Model uiModel) {
        if (pageable != null) {
        	Page<Seller> page = sellerService.findSellerEntries(pageable);
            uiModel.addAttribute("sellers", page.getContent());
            uiModel.addAttribute("maxPages", page.getTotalPages());
        } else {
            uiModel.addAttribute("sellers", sellerService.findAllSellers());
        }
        addDateTimeFormatPatterns(uiModel);
        return "admin/sellers/list";
    }
	
}
