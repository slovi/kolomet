package cz.kolomet.web;
import java.util.HashMap;
import java.util.Map;

import cz.kolomet.domain.Product;
import cz.kolomet.repository.ProductRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/products")
@Controller
@RooWebScaffold(path = "products", formBackingObject = Product.class)
public class ProductController extends AbstractController {
	
	@Autowired
	private ProductRepository productRepository;
	
	@RequestMapping("/category/{categoryCodeKey}")
	public ModelAndView listByCategory(@PathVariable("categoryCodeKey") String categoryCodeKey) {
		
		Map<String, Object> model = new HashMap<String, Object>();
		setDefaultModel(model);
		if (!categoryCodeKey.equals("cat_bike_all")) {
			model.put("products", productRepository.findByCategory(categoryCodeKey));
		} else {
			model.put("products", productRepository.findByPriority());
		}
		return new ModelAndView("products/list_category", model);
	}
	
	@RequestMapping("/categorytype/{categoryTypeCodeKey}")
	public ModelAndView listByCategoryType(@PathVariable("categoryTypeCodeKey") String categoryTypeCodeKey) {
		
		Map<String, Object> model = new HashMap<String, Object>();
		setDefaultModel(model);
		model.put("products", productRepository.findByCategoryType(categoryTypeCodeKey));
		return new ModelAndView("products/list_category", model);
	}
	
}
