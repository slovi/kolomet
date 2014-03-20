package cz.kolomet.web;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import cz.kolomet.domain.Product;
import cz.kolomet.repository.ProductRepository;

@RequestMapping("/products")
@Controller
@RooWebScaffold(path = "products", formBackingObject = Product.class)
public class ProductController extends AbstractController {
	
	@Autowired
	private ProductRepository productRepository;
	
	@RequestMapping("/detail/{id}")
	public String detail(@PathVariable("id") Long id, Model model) {
		
		setDefaultModel(model);
		model.addAttribute("product", productRepository.findOne(id));
		return "products/detail";
	}
	
	@RequestMapping("/category/{categoryCodeKey}")
	public String listByCategory(@PathVariable("categoryCodeKey") String categoryCodeKey, Model model) {
		
		setDefaultModel(model);
		if (!categoryCodeKey.equals("cat_bike_all")) {
			model.addAttribute("products", productRepository.findByCategory(categoryCodeKey));
		} else {
			model.addAttribute("products", productRepository.findByPriority());
		}
		return "products/list_category";
	}
	
	@RequestMapping("/categorytype/{categoryTypeCodeKey}")
	public String listByCategoryType(@PathVariable("categoryTypeCodeKey") String categoryTypeCodeKey, Model model) {
		
		setDefaultModel(model);
		model.addAttribute("products", productRepository.findByCategoryType(categoryTypeCodeKey));
		return "products/list_category";
	}
	
}
