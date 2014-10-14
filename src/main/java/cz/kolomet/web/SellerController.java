package cz.kolomet.web;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cz.kolomet.domain.Seller;
import cz.kolomet.repository.ProductRepository;
import cz.kolomet.service.SellerService;
import cz.kolomet.web.pub.AbstractPublicController;

@RequestMapping("/public/sellers")
@Controller("publicSellerController")
public class SellerController extends AbstractPublicController {

	@Autowired
	private SellerService sellerService;
	
	@Autowired
	private ProductRepository productRepository;
	
	@RequestMapping("/map")
	public String map(Model model, @RequestParam(value = "regionCodeKey", required = false) String regionCodeKey) {
		if (StringUtils.isNotEmpty(regionCodeKey)) {
			model.addAttribute("sellers", sellerService.findByRegionCodeKeyOrderBySellerNameAsc(regionCodeKey));
		}		
		return "public/sellers/map";
	}
	
	@RequestMapping("/detail/{id}")
	public String detail(@PathVariable("id") Long id, Model model, HttpServletRequest request) {
		Seller seller = sellerService.detail(id, request.getRemoteAddr());
		model.addAttribute("seller", seller);
		model.addAttribute("products", productRepository.findBySellerId(id, new PageRequest(0, 10)));
		return "public/sellers/detail";
	}
	
}
