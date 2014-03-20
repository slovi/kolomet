package cz.kolomet.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cz.kolomet.repository.ProductRepository;

@RequestMapping("/")
@Controller
public class IntroController extends AbstractController {
	
	@Autowired
	private ProductRepository productRepository;
	
    @RequestMapping(method=RequestMethod.GET)
    public String index(Model model) {
    	
    	setDefaultModel(model);
    	model.addAttribute("products", productRepository.findByPriority());
        return "intro/index";
    }
    
    @RequestMapping(value="intro/index", method=RequestMethod.GET)
    public String introIndex(Model model) {
    	
    	setDefaultModel(model);
    	model.addAttribute("products", productRepository.findByPriority());
        return "intro/index";
    }
    
}
