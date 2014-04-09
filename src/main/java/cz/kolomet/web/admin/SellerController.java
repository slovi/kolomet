package cz.kolomet.web.admin;

import cz.kolomet.domain.Seller;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/sellers")
@Controller
@RooWebScaffold(path = "sellers", formBackingObject = Seller.class)
public class SellerController extends AbstractAdminController {
}
