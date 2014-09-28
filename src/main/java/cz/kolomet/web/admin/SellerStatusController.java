package cz.kolomet.web.admin;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cz.kolomet.domain.codelist.SellerStatus;

@RequestMapping("/admin/sellerstatuses")
@Controller
@RooWebScaffold(path = "admin/sellerstatuses", formBackingObject = SellerStatus.class)
public class SellerStatusController extends AbstractAdminController {
}
