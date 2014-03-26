package cz.kolomet.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cz.kolomet.repository.ProductRepository;

@RequestMapping("/public")
@Controller
public class IntroController extends AbstractController {
	
	private Integer productsSize = 9;
	
	@Autowired
	private ProductRepository productRepository;
	
    @RequestMapping(method=RequestMethod.GET)
    public String index(Model model) {
    	
    	model.addAttribute("products", productRepository.findByPriority(new PageRequest(0, productsSize)));
        return "intro/index";
    }
    
    @RequestMapping(value="intro/index", method=RequestMethod.GET)
    public String introIndex(Model model) {
    	
    	model.addAttribute("products", productRepository.findByPriority(new PageRequest(0, productsSize)));
        return "intro/index";
    }
    
}
