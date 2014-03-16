package cz.kolomet.web;

import cz.kolomet.domain.codelist.SellerStatus;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/sellerstatuses")
@Controller
@RooWebScaffold(path = "sellerstatuses", formBackingObject = SellerStatus.class)
public class SellerStatusController {
}