package cz.kolomet.web;

import javax.persistence.EntityNotFoundException;

import org.apache.commons.lang3.BooleanUtils;
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
import cz.kolomet.repository.SellerRepository;

@RequestMapping("/public/sellers")
@Controller("publicSellerController")
public class SellerController extends AbstractController {

	@Autowired
	private SellerRepository sellerRepository;
	
	@Autowired
	private ProductRepository productRepository;
	
	@RequestMapping("/map")
	public String map(Model model, @RequestParam(value = "regionCodeKey", required = false) String regionCodeKey) {
		if (StringUtils.isNotEmpty(regionCodeKey)) {
			model.addAttribute("sellers", sellerRepository.findByRegionCodeKeyOrderBySellerNameDesc(regionCodeKey));
		}		
		return "sellers/map";
	}
	
	@RequestMapping("/detail/{id}")
	public String detail(@PathVariable("id") Long id, Model model) {
		Seller seller = sellerRepository.findOne(id);
		if (BooleanUtils.isFalse(seller.getEnabled())) {
			throw new EntityNotFoundException("Cannot find seller");
		}
		model.addAttribute("seller", seller);
		model.addAttribute("products", productRepository.findBySellerId(id, new PageRequest(0, 10)));
		return "sellers/detail";
	}
	
}
