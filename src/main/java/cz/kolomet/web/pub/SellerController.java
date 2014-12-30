package cz.kolomet.web.pub;

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
import cz.kolomet.domain.codelist.Region;
import cz.kolomet.repository.ProductRepository;
import cz.kolomet.repository.RegionRepository;
import cz.kolomet.repository.SellerRepository;
import cz.kolomet.service.SellerService;

@RequestMapping("/public/sellers")
@Controller("publicSellerController")
public class SellerController extends AbstractPublicController {

	@Autowired
	private SellerRepository sellerRepository;
	
	@Autowired
	private SellerService sellerService;
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private RegionRepository regionRepository;
	
	@RequestMapping("/map")
	public String map(Model model, @RequestParam(value = "regionCodeKey", required = false) String regionCodeKey) {
		if (StringUtils.isNotEmpty(regionCodeKey)) {
			// TODO - predelat na dto
			Region region = regionRepository.findByCodeKey(regionCodeKey);
			model.addAttribute("sellers", sellerRepository.findByRegionCodeKeyOrderBySellerNameAsc(regionCodeKey));
			model.addAttribute("pageTitleCode", "page_seller_map_title_filtered");
			model.addAttribute("pageTitleArgs", new Object[] {region.getCodeDescription()});
			model.addAttribute("pageDescriptionCode", "page_seller_map_title_filtered");
		} else {
			model.addAttribute("pageTitleCode", "page_seller_map_title_all");
			model.addAttribute("pageDescriptionCode", "page_seller_map_title_all");
		}
		return "public/sellers/map";
	}
	
	@RequestMapping("/detail/{id}")
	public String detail(@PathVariable("id") Long id, Model model, HttpServletRequest request) {
		// TODO - predelat na dto
		Seller seller = sellerService.detail(id, request.getRemoteAddr());
		model.addAttribute("seller", seller);
		model.addAttribute("products", productRepository.findBySellerId(id, new PageRequest(0, 10)));
		return "public/sellers/detail";
	}
	
}
