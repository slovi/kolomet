package cz.kolomet.web.admin;

import cz.kolomet.domain.Seller;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/sellers")
@Controller
@RooWebScaffold(path = "admin/sellers", formBackingObject = Seller.class)
public class SellerController extends AbstractAdminController {
	
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
